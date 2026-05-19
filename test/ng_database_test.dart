import 'dart:io';

import 'package:nebula_dart_gdbc/nebula_dart_gdbc.dart';
import 'package:test/test.dart';

// ── Helper classes ──────────────────────────────────────────────────────────

class _PropDef extends Prop {
  final String name;
  final String type;
  final bool? nullable;
  final String? defaultValue;

  _PropDef(this.name, this.type, {this.nullable, this.defaultValue});

  Map<String, dynamic> toJson() => {
        'name': name,
        'type': type,
        if (nullable != null) 'nullable': nullable,
        if (defaultValue != null) 'default': defaultValue,
      };
}

class _TagTable extends Table {
  final String name;
  final List<Prop> props;

  _TagTable(this.name, this.props);

  Map<String, dynamic> toJson() => {'name': name, 'props': props};
}

class _EdgeTable extends Table {
  final String name;
  final List<Prop> props;

  _EdgeTable(this.name, this.props);

  Map<String, dynamic> toJson() => {'name': name, 'props': props};
}

class _SpaceConfig extends Db {
  final String name;

  _SpaceConfig(this.name);

  Map<String, dynamic> toJson() => {
        'name': name,
        'partitionNum': 10,
        'relicaFactor': 1,
        'isString': true,
        'vidLength': 16,
        'comment': '',
      };
}

class _PropRef {
  final String name;
  final int? length; // For variable-length string indexes (e.g., `name(10)`)

  _PropRef(this.name, {this.length});

  Map<String, dynamic> toJson() => {
        'name': name,
        if (length != null) 'length': length,
      };
}

class _Index extends Idx {
  final String type;
  final String name;
  final String schema;
  final List<_PropRef> fields;

  _Index({
    required this.type,
    required this.name,
    required this.schema,
    required this.fields,
  });

  Map<String, dynamic> toJson() => {
        'type': type,
        'name': name,
        'schema': schema,
        // Template wraps each field in backticks; length is kept in
        // _PropRef for programmatic use but serialized as plain name.
        'fields': fields.map((f) => f.name).toList(),
      };
}

class _AlterOp {
  final String op;
  final List<Prop> props;

  _AlterOp(this.op, this.props);

  Map<String, dynamic> toJson() => {
        'op': op,
        'props': props,
      };
}

/// A property value reference used in vertex/edge data CRUD.
/// [value] must be GQL-formatted (e.g. `'Alice'` for strings, `42` for ints).
class _PropValue {
  final String name;
  final String value;

  _PropValue(this.name, this.value);

  Map<String, dynamic> toJson() => {'name': name, 'value': value};
}

class _VertexRecord {
  final String tag;
  final String vid;
  final List<_PropValue> props;

  _VertexRecord(this.tag, this.vid, this.props);

  Map<String, dynamic> toJson() => {'tag': tag, 'vid': vid, 'props': props};
}

class _EdgeRecord {
  final String edge;
  final String src;
  final String dst;
  final int ranking;
  final List<_PropValue> props;

  _EdgeRecord(this.edge, this.src, this.dst, this.ranking, this.props);

  Map<String, dynamic> toJson() => {
        'edge': edge,
        'src': src,
        'dst': dst,
        'ranking': ranking,
        'props': props,
      };
}

// ── Env parsing ─────────────────────────────────────────────────────────────

Map<String, String> _parseEnv(String path) {
  var file = File(path);
  if (!file.existsSync()) {
    throw ArgumentError('.env.test not found at $path');
  }

  var env = <String, String>{};
  for (var line in file.readAsLinesSync()) {
    line = line.trim();
    if (line.isEmpty || line.startsWith('#')) continue;
    var eqIdx = line.indexOf('=');
    if (eqIdx < 0) continue;
    var key = line.substring(0, eqIdx).trim();
    var value = line.substring(eqIdx + 1).trim();
    if (key.isNotEmpty) env[key] = value;
  }
  return env;
}

// ── NebulaGraph helpers ─────────────────────────────────────────────────────

Future<void> _waitForSpace(GraphDatabase db, String space,
    {Connection? conn, int maxRetries = 30}) async {
  for (var i = 0; i < maxRetries; i++) {
    try {
      await db.switchSpace(space, conn: conn);
      return;
    } catch (_) {
      await Future.delayed(const Duration(seconds: 1));
    }
  }
  throw ArgumentError('Space $space not ready after ${maxRetries}s');
}

Future<String> _createTestSpace(GraphDatabase db, String prefix,
    {Connection? conn}) async {
  var name = '${prefix}_${DateTime.now().millisecondsSinceEpoch}';
  await db.createDb(_SpaceConfig(name));
  await _waitForSpace(db, name, conn: conn);
  return name;
}

/// Wait for schema change (tag/edge/index) to propagate.
/// NebulaGraph heartbeat is 10s, guarantee up to 20s.
Future<void> _waitForSchema() async {
  await Future.delayed(const Duration(seconds: 15));
}

/// Retry an async operation up to [maxRetries] times with [delay] between.
Future<T> _retry<T>(Future<T> Function() fn,
    {int maxRetries = 5, Duration delay = const Duration(seconds: 3)}) async {
  for (var i = 0; i < maxRetries; i++) {
    try {
      return await fn();
    } catch (_) {
      if (i == maxRetries - 1) rethrow;
      await Future.delayed(delay);
    }
  }
  throw StateError('unreachable');
}

// ── Tests ───────────────────────────────────────────────────────────────────

void main() {
  late Connection conn;
  late GraphDatabase db;

  setUpAll(() async {
    DriverManager.registerDriver(NgDriver());

    var possiblePaths = [
      '${Directory.current.path}/.env.test',
      '${Directory.current.path}/nebula_dart_gdbc/.env.test',
    ];

    String? actualPath;
    for (var p in possiblePaths) {
      if (File(p).existsSync()) {
        actualPath = p;
        break;
      }
    }

    if (actualPath == null) {
      throw ArgumentError('.env.test not found. Searched: $possiblePaths');
    }

    var env = _parseEnv(actualPath);

    var url = env['url'];
    var username = env['username'];
    var password = env['password'];

    if (url == null || url.isEmpty) {
      throw ArgumentError('url is required in .env.test');
    }
    if (username == null || username.isEmpty) {
      throw ArgumentError('username is required in .env.test');
    }
    if (password == null || password.isEmpty) {
      throw ArgumentError('password is required in .env.test');
    }

    var c = await DriverManager.getConnection(
      url,
      username: username,
      password: password,
    );
    conn = c;
    db = conn.database! as GraphDatabase;
  });

  tearDownAll(() async {
    try {
      await conn.close();
    } catch (_) {}
  });

  // ──────────────────────────────────────────────────────────────────────────
  // Space CRUD
  // ──────────────────────────────────────────────────────────────────────────

  group('Space management', () {
    late String testSpace;

    setUpAll(() async {
      testSpace = await _createTestSpace(db, 'test_space', conn: conn);
    });

    tearDownAll(() async {
      await db.dropDb(testSpace);
    });

    test('databases() returns all spaces', () async {
      var spaces = await db.databases();
      expect(spaces, isA<List>());
      expect(spaces.map((e) => e.toString()), contains(testSpace));
    });

    test('dbInfo returns space info', () async {
      var info = await db.dbInfo(testSpace);
      expect(info, isA<NgSpaceInfo>());
      var spaceInfo = info as NgSpaceInfo;
      expect(spaceInfo.name, testSpace);
      expect(spaceInfo.partitionNum, greaterThan(0));
      expect(spaceInfo.replicaFactor, greaterThan(0));
    });

    test('switchSpace switches to test space', () async {
      await db.switchSpace(testSpace, conn: conn);
    });

    test('ping returns true', () async {
      var result = await db.ping();
      expect(result, isTrue);
    });

    test('createDb and dropDb round trip', () async {
      var name = 'test_round_${DateTime.now().millisecondsSinceEpoch}';
      await db.createDb(_SpaceConfig(name));
      await _waitForSpace(db, name, conn: conn);

      // read-back verification
      var info = await db.dbInfo(name);
      expect(info, isA<NgSpaceInfo>());
      expect((info as NgSpaceInfo).name, name);

      var spaces = await db.databases();
      expect(spaces.map((e) => e.toString()), contains(name));

      await db.dropDb(name);

      var spacesAfter = await db.databases();
      expect(spacesAfter.map((e) => e.toString()), isNot(contains(name)));
    });

    test('cloneDb', () async {
      var fromName = 'clone_src_${DateTime.now().millisecondsSinceEpoch}';
      var toName = 'clone_dst_${DateTime.now().millisecondsSinceEpoch}';
      await db.createDb(_SpaceConfig(fromName));
      await _waitForSpace(db, fromName, conn: conn);

      await db.cloneDb(fromName, toName);
      await _waitForSpace(db, toName, conn: conn);

      // read-back verification
      var info = await db.dbInfo(toName);
      expect(info, isA<NgSpaceInfo>());
      expect((info as NgSpaceInfo).name, toName);

      var spaces = await db.databases();
      expect(spaces.map((e) => e.toString()), contains(toName));

      await db.dropDb(toName);
      await db.dropDb(fromName);
    });
  });

  // ──────────────────────────────────────────────────────────────────────────
  // Tag (vertex) CRUD
  // ──────────────────────────────────────────────────────────────────────────

  group('Tag management', () {
    late String testSpace;

    setUpAll(() async {
      testSpace = await _createTestSpace(db, 'test_tags', conn: conn);
    });

    tearDownAll(() async {
      await db.dropDb(testSpace);
    });

    test('createTag creates a tag', () async {
      var props = <Prop>[
        _PropDef('name', 'string', nullable: false),
        _PropDef('age', 'int'),
        _PropDef('salary', 'double', defaultValue: '0.0'),
      ];
      var tag = _TagTable('person', props);

      await expectLater(db.createTag(testSpace, tag), completes);
      await _waitForSchema();

      // read-back verification
      var info = await _retry(() => db.tag('person', _SpaceConfig(testSpace)));
      expect(info, isA<NgTableInfo>());
      var ngInfo = info as NgTableInfo;
      expect(ngInfo.name, 'person');
      expect(ngInfo.props.length, props.length);
      expect((ngInfo.props[0] as NgProp).name, 'name');
      expect((ngInfo.props[0] as NgProp).nullable, false);
      expect((ngInfo.props[1] as NgProp).name, 'age');
      expect((ngInfo.props[1] as NgProp).nullable, true);
      expect((ngInfo.props[2] as NgProp).name, 'salary');
      expect((ngInfo.props[2] as NgProp).defaultValue, '0.0');
    });

    test('tags returns all tags', () async {
      var tags = await db.tags(testSpace);
      expect(tags, isA<List>());
      expect(tags.map((e) => e.toString()), contains('person'));
    });

    test('tag describes a tag', () async {
      var tagInfo = await db.tag('person', _SpaceConfig(testSpace));
      expect(tagInfo, isA<NgTableInfo>());
    });

    test('alterTag via proxy', () async {
      var newProps = <Prop>[
        _PropDef('email', 'string'),
      ];
      var alter = _AlterOp('ADD', newProps);

      await db.proxy(
        db.alterTagOp,
        {'db': _SpaceConfig(testSpace), 'origin': 'person', 'alter': [alter]},
      );
      await _waitForSchema();

      // verify alter took effect
      var info = await _retry(() => db.tag('person', _SpaceConfig(testSpace)));
      expect(info, isA<NgTableInfo>());
      var props = (info as NgTableInfo).props;
      var emails = props.where((p) => (p as NgProp).name == 'email').toList();
      expect(emails.length, 1);
    });

    test('createTag with 0 props', () async {
      var tag = _TagTable('empty_tag', <Prop>[]);
      await expectLater(db.createTag(testSpace, tag), completes);
      await _waitForSchema();

      var info = await _retry(
        () => db.tag('empty_tag', _SpaceConfig(testSpace)),
      );
      expect(info, isA<NgTableInfo>());
      expect((info as NgTableInfo).props.length, 0);

      await db.dropTag(_SpaceConfig(testSpace), 'empty_tag');
    });

    test('createTag with all data types', () async {
      var props = <Prop>[
        _PropDef('p_bool', 'bool'),
        _PropDef('p_int64', 'int64'),
        _PropDef('p_float', 'float'),
        _PropDef('p_double', 'double'),
        _PropDef('p_string', 'string'),
        _PropDef('p_fixed', 'fixed_string(32)'),
        _PropDef('p_date', 'date'),
        _PropDef('p_time', 'time'),
        _PropDef('p_datetime', 'datetime'),
        _PropDef('p_timestamp', 'timestamp'),
        // features
        _PropDef('p_notnull', 'string', nullable: false),
        _PropDef('p_default', 'int64', defaultValue: '42'),
      ];
      var tag = _TagTable('all_types', props);
      await db.createTag(testSpace, tag);
      await _waitForSchema();

      var info = await _retry(
        () => db.tag('all_types', _SpaceConfig(testSpace)),
      );
      expect(info, isA<NgTableInfo>());
      var ngInfo = info as NgTableInfo;
      expect(ngInfo.props.length, props.length);

      // 10 types
      expect((ngInfo.props[0] as NgProp).name, 'p_bool');
      expect((ngInfo.props[0] as NgProp).type, 'bool');
      expect((ngInfo.props[1] as NgProp).name, 'p_int64');
      expect((ngInfo.props[1] as NgProp).type, 'int64');
      expect((ngInfo.props[2] as NgProp).name, 'p_float');
      expect((ngInfo.props[2] as NgProp).type, 'float');
      expect((ngInfo.props[3] as NgProp).name, 'p_double');
      expect((ngInfo.props[3] as NgProp).type, 'double');
      expect((ngInfo.props[4] as NgProp).name, 'p_string');
      expect((ngInfo.props[4] as NgProp).type, 'string');
      expect((ngInfo.props[5] as NgProp).name, 'p_fixed');
      expect((ngInfo.props[5] as NgProp).type, contains('fixed_string'));
      expect((ngInfo.props[6] as NgProp).name, 'p_date');
      expect((ngInfo.props[6] as NgProp).type, 'date');
      expect((ngInfo.props[7] as NgProp).name, 'p_time');
      expect((ngInfo.props[7] as NgProp).type, 'time');
      expect((ngInfo.props[8] as NgProp).name, 'p_datetime');
      expect((ngInfo.props[8] as NgProp).type, 'datetime');
      expect((ngInfo.props[9] as NgProp).name, 'p_timestamp');
      expect((ngInfo.props[9] as NgProp).type, 'timestamp');

      // features: NOT NULL, nullable (default), DEFAULT
      expect((ngInfo.props[0] as NgProp).nullable, true);
      expect((ngInfo.props[10] as NgProp).name, 'p_notnull');
      expect((ngInfo.props[10] as NgProp).nullable, false);
      expect((ngInfo.props[11] as NgProp).name, 'p_default');
      expect((ngInfo.props[11] as NgProp).defaultValue, '42');
    });

    test('createTag with 1 prop (single-element list)', () async {
      var tag = _TagTable('single_prop', [
        _PropDef('only_one', 'int64'),
      ]);
      await db.createTag(testSpace, tag);
      await _waitForSchema();

      var info = await _retry(
        () => db.tag('single_prop', _SpaceConfig(testSpace)),
      );
      expect(info, isA<NgTableInfo>());
      expect((info as NgTableInfo).props.length, 1);
      expect((info.props[0] as NgProp).name, 'only_one');
    });

    test('createTag and dropTag round trip', () async {
      var props = <Prop>[
        _PropDef('x', 'int'),
      ];
      var tag = _TagTable('temp_tag', props);
      await db.createTag(testSpace, tag);
      await _waitForSchema();

      // read-back verification
      var info = await _retry(() => db.tag('temp_tag', _SpaceConfig(testSpace)));
      expect(info, isA<NgTableInfo>());
      expect((info as NgTableInfo).props.length, 1);
      expect((info.props[0] as NgProp).name, 'x');

      var tags = await db.tags(testSpace);
      expect(tags.map((e) => e.toString()), contains('temp_tag'));

      await db.dropTag(_SpaceConfig(testSpace), 'temp_tag');

      var tagsAfter = await db.tags(testSpace);
      expect(tagsAfter.map((e) => e.toString()), isNot(contains('temp_tag')));
    });
  });

  // ──────────────────────────────────────────────────────────────────────────
  // Edge CRUD
  // ──────────────────────────────────────────────────────────────────────────

  group('Edge management', () {
    late String testSpace;

    setUpAll(() async {
      testSpace = await _createTestSpace(db, 'test_edges', conn: conn);
    });

    tearDownAll(() async {
      await db.dropDb(testSpace);
    });

    test('createEdge creates an edge', () async {
      var props = <Prop>[
        _PropDef('relation', 'string'),
        _PropDef('weight', 'double', defaultValue: '1.0'),
      ];
      var edge = _EdgeTable('knows', props);

      await expectLater(db.createEdge(testSpace, edge), completes);
      await _waitForSchema();

      // read-back verification
      var info = await _retry(() => db.edge('knows', _SpaceConfig(testSpace)));
      expect(info, isA<NgTableInfo>());
      var ngInfo = info as NgTableInfo;
      expect(ngInfo.name, 'knows');
      expect(ngInfo.props.length, props.length);
      expect((ngInfo.props[0] as NgProp).name, 'relation');
      expect((ngInfo.props[1] as NgProp).name, 'weight');
      expect((ngInfo.props[1] as NgProp).defaultValue, '1.0');
    });

    test('edges returns all edges', () async {
      var edges = await db.edges(testSpace);
      expect(edges, isA<List>());
      expect(edges.map((e) => e.toString()), contains('knows'));
    });

    test('edge describes an edge', () async {
      var edgeInfo = await db.edge('knows', _SpaceConfig(testSpace));
      expect(edgeInfo, isA<NgTableInfo>());
    });

    test('createEdge with 0 props', () async {
      var edge = _EdgeTable('empty_edge', <Prop>[]);
      await expectLater(db.createEdge(testSpace, edge), completes);
      await _waitForSchema();

      var info = await _retry(
        () => db.edge('empty_edge', _SpaceConfig(testSpace)),
      );
      expect(info, isA<NgTableInfo>());
      expect((info as NgTableInfo).props.length, 0);

      await db.dropEdge(_SpaceConfig(testSpace), 'empty_edge');
    });

    test('createEdge with 1 prop (single-element list)', () async {
      var edge = _EdgeTable('single_edge', [
        _PropDef('only_one', 'string'),
      ]);
      await db.createEdge(testSpace, edge);
      await _waitForSchema();

      var info = await _retry(
        () => db.edge('single_edge', _SpaceConfig(testSpace)),
      );
      expect(info, isA<NgTableInfo>());
      expect((info as NgTableInfo).props.length, 1);
      expect((info.props[0] as NgProp).name, 'only_one');
    });

    test('createEdge and dropEdge round trip', () async {
      var props = <Prop>[
        _PropDef('val', 'string'),
      ];
      var edge = _EdgeTable('temp_edge', props);
      await db.createEdge(testSpace, edge);
      await _waitForSchema();

      // read-back verification
      var info = await _retry(() => db.edge('temp_edge', _SpaceConfig(testSpace)));
      expect(info, isA<NgTableInfo>());
      expect((info as NgTableInfo).props.length, 1);
      expect((info.props[0] as NgProp).name, 'val');

      var edges = await db.edges(testSpace);
      expect(edges.map((e) => e.toString()), contains('temp_edge'));

      await db.dropEdge(_SpaceConfig(testSpace), 'temp_edge');

      var edgesAfter = await db.edges(testSpace);
      expect(edgesAfter.map((e) => e.toString()), isNot(contains('temp_edge')));
    });
  });

  // ──────────────────────────────────────────────────────────────────────────
  // Index CRUD
  // ──────────────────────────────────────────────────────────────────────────

  group('Index management', () {
    late String testSpace;

    setUpAll(() async {
      testSpace = await _createTestSpace(db, 'test_idx', conn: conn);

      var tagProps = <Prop>[
        _PropDef('name', 'string', nullable: false),
        _PropDef('age', 'int'),
        _PropDef('score', 'int64'),
      ];
      await db.createTag(testSpace, _TagTable('idx_person', tagProps));
      await _waitForSchema();

      var edgeProps = <Prop>[
        _PropDef('weight', 'double'),
      ];
      await db.createEdge(testSpace, _EdgeTable('idx_knows', edgeProps));
      await _waitForSchema();

      // Create index and wait for it to propagate
      var index = _Index(
        type: 'TAG',
        name: 'person_age_idx',
        schema: 'idx_person',
        fields: [_PropRef('age')],
      );
      await db.createIndex(testSpace, index);
      await _waitForSchema();
    });

    tearDownAll(() async {
      await db.dropDb(testSpace);
    });

    test('indexes returns created indexes', () async {
      var indexes = await db.proxy<List>(
        db.indexesOp,
        {'space': testSpace, 'type': 'TAG', 'schemaName': 'idx_person'},
      );
      expect(indexes, isA<List>());
      expect(indexes.any((e) {
        if (e is Map) return e['name'] == 'person_age_idx';
        return e.toString() == 'person_age_idx';
      }), isTrue);
    });

    test('rebuildIndex', () async {
      var index = _Index(
        type: 'TAG',
        name: 'person_age_idx',
        schema: 'idx_person',
        fields: [_PropRef('age')],
      );

      await expectLater(db.rebuildIndex(testSpace, index), completes);

      // verify index still exists after rebuild
      var indexes = await db.proxy<List>(
        db.indexesOp,
        {'space': testSpace, 'type': 'TAG', 'schemaName': 'idx_person'},
      );
      expect(indexes.any((e) {
        if (e is Map) return e['name'] == 'person_age_idx';
        return e.toString() == 'person_age_idx';
      }), isTrue);
    });

    test('dropIndex', () async {
      var index = _Index(
        type: 'TAG',
        name: 'person_age_idx',
        schema: 'idx_person',
        fields: [_PropRef('age')],
      );

      await _retry(() => db.dropIndex(testSpace, index));
      await _waitForSchema();

      // verify index is gone
      var indexes = await db.proxy<List>(
        db.indexesOp,
        {'space': testSpace, 'type': 'TAG', 'schemaName': 'idx_person'},
      );
      expect(indexes.any((e) {
        if (e is Map) return e['name'] == 'person_age_idx';
        return e.toString() == 'person_age_idx';
      }), isFalse);
    });

    test('createIndex with 0 fields', () async {
      var index = _Index(
        type: 'TAG',
        name: 'empty_idx',
        schema: 'idx_person',
        fields: <_PropRef>[],
      );
      await expectLater(db.createIndex(testSpace, index), completes);
      await _waitForSchema();

      // verify index was created
      var indexes = await db.proxy<List>(
        db.indexesOp,
        {'space': testSpace, 'type': 'TAG', 'schemaName': 'idx_person'},
      );
      expect(indexes.any((e) {
        if (e is Map) return e['name'] == 'empty_idx';
        return e.toString() == 'empty_idx';
      }), isTrue);

      // cleanup
      await _retry(() => db.dropIndex(testSpace, index));
    });

    test('createIndex with 2 fields', () async {
      var index = _Index(
        type: 'TAG',
        name: 'person_2field_idx',
        schema: 'idx_person',
        fields: [_PropRef('age'), _PropRef('score')],
      );

      await db.createIndex(testSpace, index);
      await _waitForSchema();

      // verify index was created
      var indexes = await db.proxy<List>(
        db.indexesOp,
        {'space': testSpace, 'type': 'TAG', 'schemaName': 'idx_person'},
      );
      expect(indexes.any((e) {
        if (e is Map) return e['name'] == 'person_2field_idx';
        return e.toString() == 'person_2field_idx';
      }), isTrue);

      // cleanup
      await _retry(() => db.dropIndex(testSpace, index));
    });
  });

  // ──────────────────────────────────────────────────────────────────────────
  // Index on different field types
  // ──────────────────────────────────────────────────────────────────────────

  group('Index on different field types', () {
    late String testSpace;

    // NebulaGraph supports indexing on all types below.
    // Variable-length `string` requires an index length (e.g. `p_string(10)`),
    // but the createIndexOp template wraps each field in backticks (`{{ f }}`),
    // making it impossible to place `(10)` outside the identifier.
    // => String indexes are tested separately via raw GQL.
    final fieldProps = <_PropDef>[
      _PropDef('p_bool', 'bool'),
      _PropDef('p_int64', 'int64'),
      _PropDef('p_float', 'float'),
      _PropDef('p_double', 'double'),
      _PropDef('p_string', 'string'),
      _PropDef('p_fixed', 'fixed_string(32)'),
      _PropDef('p_date', 'date'),
      _PropDef('p_time', 'time'),
      _PropDef('p_datetime', 'datetime'),
      _PropDef('p_timestamp', 'timestamp'),
    ];

    // Fields that can be indexed via the template (non-string types).
    final indexableProps = fieldProps.where((p) => p.type != 'string').toList();

    setUpAll(() async {
      testSpace = await _createTestSpace(db, 'test_idx_types', conn: conn);

      await db.createTag(testSpace, _TagTable('type_idx_tag', fieldProps));
      await _waitForSchema();

      await db.createEdge(
          testSpace, _EdgeTable('type_idx_edge', fieldProps));
      await _waitForSchema();
    });

    tearDownAll(() async {
      await db.dropDb(testSpace);
    });

    test('create TAG index on each field type', () async {
      var indexes = indexableProps.map((p) {
        return _Index(
          type: 'TAG',
          name: 'idx_tag_${p.name}',
          schema: 'type_idx_tag',
          fields: [_PropRef(p.name)],
        );
      }).toList();

      for (var idx in indexes) {
        await db.createIndex(testSpace, idx);
      }
      await _waitForSchema();

      var listed = await _retry(() => db.proxy<List>(
            db.indexesOp,
            {'space': testSpace, 'type': 'TAG', 'schemaName': 'type_idx_tag'},
          ));
      for (var idx in indexes) {
        expect(listed.any((e) {
          if (e is Map) return e['name'] == idx.name;
          return e.toString() == idx.name;
        }), isTrue);
      }

      for (var idx in indexes) {
        await _retry(() => db.dropIndex(testSpace, idx));
      }
      await _waitForSchema();
    }, timeout: Timeout(Duration(minutes: 2)));

    test('create EDGE index on each field type', () async {
      var indexes = indexableProps.map((p) {
        return _Index(
          type: 'EDGE',
          name: 'idx_edge_${p.name}',
          schema: 'type_idx_edge',
          fields: [_PropRef(p.name)],
        );
      }).toList();

      for (var idx in indexes) {
        await db.createIndex(testSpace, idx);
      }
      await _waitForSchema();

      var listed = await _retry(() => db.proxy<List>(
            db.indexesOp,
            {'space': testSpace, 'type': 'EDGE', 'schemaName': 'type_idx_edge'},
          ));
      for (var idx in indexes) {
        expect(listed.any((e) {
          if (e is Map) return e['name'] == idx.name;
          return e.toString() == idx.name;
        }), isTrue);
      }

      for (var idx in indexes) {
        await _retry(() => db.dropIndex(testSpace, idx));
      }
      await _waitForSchema();
    }, timeout: Timeout(Duration(minutes: 2)));

    test('create TAG composite index with multiple types', () async {
      var index = _Index(
        type: 'TAG',
        name: 'idx_tag_composite',
        schema: 'type_idx_tag',
        fields: [_PropRef('p_bool'), _PropRef('p_fixed'), _PropRef('p_datetime')],
      );

      await db.createIndex(testSpace, index);
      await _waitForSchema();

      var listed = await _retry(() => db.proxy<List>(
            db.indexesOp,
            {'space': testSpace, 'type': 'TAG', 'schemaName': 'type_idx_tag'},
          ));
      expect(listed.any((e) {
        if (e is Map) return e['name'] == index.name;
        return e.toString() == index.name;
      }), isTrue);

      await _retry(() => db.dropIndex(testSpace, index));
      await _waitForSchema();
    }, timeout: Timeout(Duration(minutes: 2)));

    test('create EDGE composite index with multiple types', () async {
      var index = _Index(
        type: 'EDGE',
        name: 'idx_edge_composite',
        schema: 'type_idx_edge',
        fields: [_PropRef('p_int64'), _PropRef('p_double'), _PropRef('p_date')],
      );

      await db.createIndex(testSpace, index);
      await _waitForSchema();

      var listed = await _retry(() => db.proxy<List>(
            db.indexesOp,
            {'space': testSpace, 'type': 'EDGE', 'schemaName': 'type_idx_edge'},
          ));
      expect(listed.any((e) {
        if (e is Map) return e['name'] == index.name;
        return e.toString() == index.name;
      }), isTrue);

      await _retry(() => db.dropIndex(testSpace, index));
      await _waitForSchema();
    }, timeout: Timeout(Duration(minutes: 2)));

    test('create TAG string index via raw GQL', () async {
      var strField = _PropRef('p_string', length: 10);
      await db.proxy<double>(
        Dialect<double>(
          'USE `{{ db }}`;\n'
          'CREATE TAG INDEX IF NOT EXISTS `{{ name }}`\n'
          'ON `{{ schema }}` (\n'
          '  `{{ field }}`({{ length }})\n'
          ');',
          handler: (rs, [params]) => 0.0,
        ),
        {
          'db': testSpace,
          'name': 'idx_tag_p_string',
          'schema': 'type_idx_tag',
          'field': strField.name,
          'length': strField.length,
        },
      );
      await _waitForSchema();

      var listed = await _retry(() => db.proxy<List>(
            db.indexesOp,
            {'space': testSpace, 'type': 'TAG', 'schemaName': 'type_idx_tag'},
          ));
      expect(listed.any((e) {
        if (e is Map) return e['name'] == 'idx_tag_p_string';
        return e.toString() == 'idx_tag_p_string';
      }), isTrue);

      await _retry(() => db.dropIndex(
          testSpace,
          _Index(
              type: 'TAG',
              name: 'idx_tag_p_string',
              schema: 'type_idx_tag',
              fields: [_PropRef('p_string')])));
      await _waitForSchema();
    }, timeout: Timeout(Duration(minutes: 2)));
  });

  // ──────────────────────────────────────────────────────────────────────────
  // Vertex and Edge data CRUD
  // ──────────────────────────────────────────────────────────────────────────

  group('Vertex and Edge CRUD', () {
    late String testSpace;

    setUpAll(() async {
      testSpace = await _createTestSpace(db, 'test_crud', conn: conn);

      var personProps = <_PropDef>[
        _PropDef('name', 'string'),
        _PropDef('age', 'int'),
        _PropDef('active', 'bool'),
      ];
      await db.createTag(testSpace, _TagTable('crud_person', personProps));
      await _waitForSchema();

      var edgeProps = <_PropDef>[
        _PropDef('weight', 'double'),
        _PropDef('relation', 'string'),
      ];
      await db.createEdge(
          testSpace, _EdgeTable('crud_knows', edgeProps));
      await _waitForSchema();

      // LOOKUP requires an index at runtime; use non-string fields to avoid length specifier
      await db.createIndex(testSpace,
          _Index(type: 'TAG', name: 'idx_crud_person', schema: 'crud_person', fields: [_PropRef('age')]));
      await db.createIndex(testSpace,
          _Index(type: 'EDGE', name: 'idx_crud_knows', schema: 'crud_knows', fields: [_PropRef('weight')]));
      await _waitForSchema();
    });

    tearDownAll(() async {
      await db.dropDb(testSpace);
    });

    test('insert and getTagData', () async {
      await db.insertVertex(
        testSpace,
        _VertexRecord('crud_person', '"vid1"', [
          _PropValue('name', "'Alice'"),
          _PropValue('age', '30'),
          _PropValue('active', 'true'),
        ]).toJson(),
      );

      var result = await db.getTagData(
        testSpace,
        _TagTable('crud_person', []),
      );
      expect(result, isA<ResultSet>());
    });

    test('updateVertex', () async {
      await db.updateVertex(
        testSpace,
        _VertexRecord('crud_person', '"vid1"', [
          _PropValue('age', '31'),
        ]).toJson(),
      );
    });

    test('deleteVertexById', () async {
      await db.deleteVertexById(testSpace, 'crud_person', '"vid1"',
          true);
    });

    test('insertEdge and getEdgeData', () async {
      await db.insertVertex(
        testSpace,
        _VertexRecord('crud_person', '"src1"', [
          _PropValue('name', "'Bob'"),
          _PropValue('age', '25'),
          _PropValue('active', 'true'),
        ]).toJson(),
      );
      await db.insertVertex(
        testSpace,
        _VertexRecord('crud_person', '"dst1"', [
          _PropValue('name', "'Carol'"),
          _PropValue('age', '28'),
          _PropValue('active', 'true'),
        ]).toJson(),
      );

      await db.insertEdge(
        testSpace,
        _EdgeRecord('crud_knows', '"src1"', '"dst1"', 0, [
          _PropValue('weight', '1.5'),
          _PropValue('relation', "'friend'"),
        ]).toJson(),
      );

      var result = await db.getEdgeData(
        testSpace,
        _EdgeTable('crud_knows', []),
      );
      expect(result, isA<ResultSet>());
    });

    test('deleteEdge', () async {
      await db.deleteEdge(
        testSpace,
        _EdgeRecord('crud_knows', '"src1"', '"dst1"', 0, []).toJson(),
      );
    });
  });

  // ──────────────────────────────────────────────────────────────────────────
  // Admin queries
  // ──────────────────────────────────────────────────────────────────────────

  group('Admin queries', () {
    test('hosts returns a list', () async {
      var result = await db.hosts();
      expect(result, isA<List>());
    });

    test('sessions returns a list', () async {
      var result = await db.sessions();
      expect(result, isA<List>());
    });
  });
}
