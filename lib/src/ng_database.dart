part of '../nebula_dart_gdbc.dart';

// ── Return types for DESCRIBE / info operations ──────────────────────────

class NgProp extends Prop {
  final String name;
  final String type;
  final bool nullable;
  final String? defaultValue;

  NgProp(this.name, this.type, {this.nullable = true, this.defaultValue});

  Map<String, dynamic> toJson() => {
        'name': name,
        'type': type,
        'nullable': nullable,
        if (defaultValue != null) 'default': defaultValue,
      };
}

class NgTableInfo extends Table {
  final String? name;
  final List<Prop> props;

  NgTableInfo(this.name, this.props);

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        'props': props,
      };
}

class NgSpaceInfo extends Db {
  final int id;
  final String name;
  final int partitionNum;
  final int replicaFactor;
  final String charset;
  final String collate;
  final String vidType;
  final String comment;

  NgSpaceInfo({
    required this.id,
    required this.name,
    required this.partitionNum,
    required this.replicaFactor,
    required this.charset,
    required this.collate,
    required this.vidType,
    required this.comment,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'partitionNum': partitionNum,
        'relicaFactor': replicaFactor,
        'isString': vidType.startsWith('FIXED_STRING'),
        'vidLength': int.tryParse(vidType.replaceAll(RegExp(r'[^0-9]'), '')) ?? 16,
        'comment': comment,
      };
}

mixin NgHasTag on Database {
  /// {'space': space}
  Dialect<List> get tagsOp => Dialect<List>(
        'USE `{{ space }}`; SHOW TAGS;',
        handler: (rs, [params]) => rs.rows.map((r) => r[0] as String).toList(),
      );

  /// {'name': name, 'db': db}
  Dialect<Table?> get tagOp => Dialect<Table?>(
        'USE `{{ db.name }}`; DESCRIBE TAG `{{ name }}`;',
        handler: (rs, [params]) {
          if (rs.rows.isEmpty) return NgTableInfo(params?['name'], []);
          var props = rs.rows.map((r) => NgProp(
                r[0] as String,
                r[1] as String,
                nullable: r[2] == 'YES',
                defaultValue: r[3]?.toString(),
              )).toList();
          return NgTableInfo(params?['name'], props);
        },
      );

  /// {"db": db, "tag": table}
  Dialect<void> get createTagOp => Dialect<void>(
        'USE `{{ db }}`;\n'
        'CREATE TAG IF NOT EXISTS `{{ tag.name }}` (\n'
        '{% for prop in tag.props %}'
        '  `{{ prop.name }}` {{ prop.type }}'
        '{% if prop.nullable == false %} NOT NULL{% endif %}'
        '{% if prop.default %} DEFAULT {{ prop.default }}{% endif %}'
        '{% if forloop.last == false %}'
        ',\n'
        '{% endif %}'
        '{% endfor %}'
        ');',
        handler: (rs, [params]) {},
      );

  /// {"db": db, "origin": origin, "alter": alter}
  Dialect<void> get alterTagOp => Dialect<void>(
        'USE `{{ db.name }}`;\n'
        'ALTER TAG `{{ origin }}`'
        '{% for alter_op in alter %}'
        ' {{ alter_op.op }} ('
        '{% for prop in alter_op.props %}'
        '`{{ prop.name }}`{% if prop.type %} {{ prop.type }}{% endif %}'
        '{% if forloop.last == false %}'
        ', '
        '{% endif %}'
        '{% endfor %}'
        ')'
        '{% if forloop.last == false %}'
        ', '
        '{% endif %}'
        '{% endfor %}'
        ';',
        handler: (rs, [params]) {},
      );

  /// {"db": db, "tag": table}
  Dialect<void> get dropTagOp => Dialect<void>(
        'USE `{{ db.name }}`; DROP TAG `{{ tag }}`;',
        handler: (rs, [params]) {},
      );

  /// {"db": db, "tag": table}
  Dialect<int> get countTagDataOp => Dialect<int>(
        'USE `{{ db }}`;\n'
        'LOOKUP ON `{{ tag }}` YIELD id(vertex) AS id;',
        handler: (rs, [params]) => rs.rows.length,
      );

  /// {"db": db, "tag": table, 'limit': limit, 'offset': offset}
  Dialect<ResultSet> get getTagDataOp => Dialect<ResultSet>(
        'USE `{{ db }}`;\n'
        'LOOKUP ON `{{ tag.name }}` YIELD id(vertex) AS id'
        '{% if(limit) %}'
        ' | LIMIT {{ limit }}'
        '{% endif %}'
        '{% if(offset) %}'
        ' | OFFSET {{ offset }}'
        '{% endif %}'
        ';',
        handler: (rs, [params]) => rs,
      );

  /// {"db": db, "tag": table, 'ids': ids}
  Dialect<ResultSet> get getTagDataByIdsOp => Dialect<ResultSet>(
        'USE `{{ db }}`;\n'
        'FETCH PROP ON `{{ tag.name }}`\n'
        '{% for id in ids %}'
        '{{ id }}{% if forloop.last == false %}'
        ', '
        '{% endif %}'
        '{% endfor %}'
        ';',
        handler: (rs, [params]) => rs,
      );

  /// {"db": db, "tag": table, 'withEdge': withEdge, 'batchSize': batchSize}
  Dialect<void> get truncTagOp => Dialect<void>(
        'USE `{{ db }}`;\n'
        r'LOOKUP ON `{{ tag.name }}` YIELD id(vertex) AS id'
        r' | DELETE VERTEX $-.id;',
        handler: (rs, [params]) {},
      );
}

mixin NgHasEdge on Database {
  /// {'space': space}
  Dialect<List> get edgesOp => Dialect<List>(
        'USE `{{ space }}`; SHOW EDGES;',
        handler: (rs, [params]) => rs.rows.map((r) => r[0] as String).toList(),
      );

  /// {'name': name, 'db': db}
  Dialect<Table?> get edgeOp => Dialect<Table?>(
        'USE `{{ db.name }}`; DESCRIBE EDGE `{{ name }}`;',
        handler: (rs, [params]) {
          if (rs.rows.isEmpty) return NgTableInfo(params?['name'], []);
          var props = rs.rows.map((r) => NgProp(
                r[0] as String,
                r[1] as String,
                nullable: r[2] == 'YES',
                defaultValue: r[3]?.toString(),
              )).toList();
          return NgTableInfo(params?['name'], props);
        },
      );

  /// {"db": db, "edge": table}
  Dialect<void> get createEdgeOp => Dialect<void>(
        'USE `{{ db }}`;\n'
        'CREATE EDGE IF NOT EXISTS `{{ edge.name }}` (\n'
        '{% for prop in edge.props %}'
        '  `{{ prop.name }}` {{ prop.type }}'
        '{% if prop.nullable == false %} NOT NULL{% endif %}'
        '{% if prop.default %} DEFAULT {{ prop.default }}{% endif %}'
        '{% if forloop.last == false %}'
        ',\n'
        '{% endif %}'
        '{% endfor %}'
        ');',
        handler: (rs, [params]) {},
      );

  /// {"db": db, "edge": table}
  Dialect<void> get dropEdgeOp => Dialect<void>(
        'USE `{{ db.name }}`; DROP EDGE `{{ edge }}`;',
        handler: (rs, [params]) {},
      );

  /// {"db": db, "edge": table}
  Dialect<int> get countEdgeDataOp => Dialect<int>(
        'USE `{{ db }}`;\n'
        'LOOKUP ON `{{ edge.name }}` YIELD edge AS _e;',
        handler: (rs, [params]) => rs.rows.length,
      );

  /// {"db": db, "edge": table, 'limit': limit, 'offset': offset, 'withVertex': withVertex}
  Dialect<ResultSet> get getEdgeDataOp => Dialect<ResultSet>(
        'USE `{{ db }}`;\n'
        'LOOKUP ON `{{ edge.name }}` YIELD edge AS e'
        '{% if(withVertex) %}'
        ', src(edge) AS src, dst(edge) AS dst'
        '{% endif %}'
        '{% if(limit) %}'
        ' | LIMIT {{ limit }}'
        '{% endif %}'
        '{% if(offset) %}'
        ' | OFFSET {{ offset }}'
        '{% endif %}'
        ';',
        handler: (rs, [params]) => rs,
      );

  /// {"db": db, "edge": table, 'batchSize': batchSize}
  Dialect<void> get truncEdgeOp => Dialect<void>(
        'USE `{{ db }}`;\n'
        r'LOOKUP ON `{{ edge }}` YIELD edge AS e'
        r' | DELETE EDGE $-.e;',
        handler: (rs, [params]) {},
      );
}

mixin NgHasManagement on Database {
  /// {'type': type}
  Dialect<List<Map<String, dynamic>>> get hostsOp => Dialect(
        'SHOW HOSTS {{ type }}',
        handler: (rs, [params]) {
          return rs.rows
              .map(
                (e) => params?['type'] == null
                    ? {
                        'host': e[0],
                        'port': e[1],
                        'status': e[2],
                        'leaderCount': e[3],
                        'version': e[6],
                      }
                    : {
                        "host": e[0],
                        "port": e[1],
                        "status": e[2],
                        "role": e[3],
                        "gitInfo": e[4],
                        "version": e[5],
                      },
              )
              .toList();
        },
      );

  /// {'ip': ip, 'port': port}
  Dialect<void>? get addHostsOp =>
      Dialect<void>('ADD HOSTS {{ ip }}:{{ port }};',
          handler: (rs, [params]) {});

  /// {'ip': ip, 'port': port}
  Dialect<void>? get dropHostsOp =>
      Dialect<void>('DROP HOSTS {{ ip }}:{{ port }};',
          handler: (rs, [params]) {});

  Dialect<List> get databasesOp => Dialect<List>(
        'SHOW SPACES',
        handler: (rs, [params]) => rs.rows.map((r) => r[0]).toList(),
      );

  Dialect<List<Map<String, dynamic>>> get sessionsOp => Dialect(
        'SHOW SESSIONS',
        handler: (rs, [params]) => rs.rows
              .map(
                (e) => {
                  'id': e[0],
                  'user': e[1],
                  'space': e[2],
                  'createTime': e[3],
                  'updateTime': e[4],
                  'server': e[5],
                  'timeZone': e[6],
                  'clientIp': e[7],
                },
              )
              .toList(),
      );

  /// {'name': name}
  Dialect<Db> get databaseOp => Dialect<Db>(
        'DESCRIBE SPACE `{{ name }}`;',
        handler: (rs, [params]) {
          if (rs.rows.isEmpty) return Db();
          var r = rs.rows.first;
          return NgSpaceInfo(
            id: r[0] as int,
            name: r[1] as String,
            partitionNum: r[2] as int,
            replicaFactor: r[3] as int,
            charset: r[4] as String,
            collate: r[5] as String,
            vidType: r[6] as String,
            comment: r[7] as String,
          );
        },
      );

  /// {'space': space, 'schemaType': schemaType}
  Dialect<List> get schemaOp => Dialect(
        'USE `{{ space }}`; SHOW {{ schemaType }}',
        handler: (rs, [params]) => rs.rows.map((e) => e[0]).toList(),
      );

  /// {'name': name, 'conn': conn}
  Dialect<void> get switchSpaceOp => Dialect<void>(
        'USE `{{ name }}`;',
        handler: (rs, [params]) {
          if (params?['conn'] != null && params!['conn'] is NgConnection) {
            (params['conn'] as NgConnection).space = '${params['name']}';
          }
        },
      );

  /// {'db': db}
  Dialect<void> get switchSchemaOp => Dialect<void>(
        'USE `{{ db }}`;',
        handler: (rs, [params]) {},
      );
}

mixin NgHasDataControl on Database {
  /// {"db": db, "record": record}
  Dialect<void> get insertVertexOp => Dialect<void>(
        'USE `{{ db }}`;\n'
        'INSERT VERTEX `{{ record.tag }}` (\n'
        '{% for prop in record.props %}'
        '  `{{ prop.name }}`{% if forloop.last == false %}'
        ',\n'
        '{% endif %}'
        '{% endfor %}'
        ')\n'
        'VALUES {{ record.vid }}:(\n'
        '{% for prop in record.props %}'
        '  {{ prop.value }}{% if forloop.last == false %}'
        ',\n'
        '{% endif %}'
        '{% endfor %}'
        ');',
        handler: (rs, [params]) {},
      );

  /// {"db": db, "record": record}
  Dialect<void> get updateVertexOp => Dialect<void>(
        'USE `{{ db }}`;\n'
        'UPDATE VERTEX ON `{{ record.tag }}` {{ record.vid }}\n'
        'SET\n'
        '{% for prop in record.props %}'
        '  `{{ prop.name }}` = {{ prop.value }}'
        '{% if forloop.last == false %}'
        ',\n'
        '{% endif %}'
        '{% endfor %}'
        ';',
        handler: (rs, [params]) {},
      );

  /// {"db": db, "tag": table, "id": id, "withEdge": withEdge}
  Dialect<void> get deleteVertexByIdOp => Dialect<void>(
        'USE `{{ db }}`;\n'
        'DELETE VERTEX {{ id }}'
        '{% if(withEdge) %} WITH EDGE{% endif %}'
        ';',
        handler: (rs, [params]) {},
      );

  /// {"db": db, "tag": table, "id": id}
  Dialect<void> get deleteTagByIdOp => Dialect<void>(
        'USE `{{ db }}`; DELETE TAG `{{ tag }}` FROM {{ id }};',
        handler: (rs, [params]) {},
      );

  /// {"db": db, "record": record}
  Dialect<void> get insertEdgeOp => Dialect<void>(
        'USE `{{ db }}`;\n'
        'INSERT EDGE `{{ record.edge }}` (\n'
        '{% for prop in record.props %}'
        '  `{{ prop.name }}`{% if forloop.last == false %}'
        ',\n'
        '{% endif %}'
        '{% endfor %}'
        ')\n'
        'VALUES {{ record.src }}->{{ record.dst }}@{{ record.ranking }}:(\n'
        '{% for prop in record.props %}'
        '  {{ prop.value }}{% if forloop.last == false %}'
        ',\n'
        '{% endif %}'
        '{% endfor %}'
        ');',
        handler: (rs, [params]) {},
      );

  /// {"db": db, "record": record}
  Dialect<void> get updateEdgeOp => Dialect<void>(
        'USE `{{ db }}`;\n'
        'UPDATE EDGE ON `{{ record.edge }}`\n'
        '{{ record.src }}->{{ record.dst }}@{{ record.ranking }}\n'
        'SET\n'
        '{% for prop in record.props %}'
        '  `{{ prop.name }}` = {{ prop.value }}'
        '{% if forloop.last == false %}'
        ',\n'
        '{% endif %}'
        '{% endfor %}'
        ';',
        handler: (rs, [params]) {},
      );

  /// {"db": db, "record": record}
  Dialect<void> get deleteEdgeOp => Dialect<void>(
        'USE `{{ db }}`;\n'
        'DELETE EDGE `{{ record.edge }}`\n'
        '{{ record.src }}->{{ record.dst }}@{{ record.ranking }};',
        handler: (rs, [params]) {},
      );

  /// {"rs": rs, "table": table, "db": db, "streamHandler": streamHandler}
  Dialect<double> get importDataOp =>
      Dialect<double>('YIELD 1;', handler: (rs, [params]) => 0.0);

  /// {"db": db, "condition": condition}
  Dialect<ResultSet> get getNeighborsOp => Dialect<ResultSet>(
        'USE `{{ db }}`;\n'
        'GET SUBGRAPH WITH PROP FROM {{ condition.vid }}'
        '{% if(condition.edgeTypes) %}'
        ' OF `{{ condition.edgeTypes }}`'
        '{% endif %}'
        ' {{ condition.direction }} {{ condition.steps }} STEPS\n'
        'YIELD VERTICES AS nodes, EDGES AS edges;',
        handler: (rs, [params]) => rs,
      );

  /// {"db": db, "condition": condition}
  Dialect<int> get countNeighborsOp => Dialect<int>(
        'USE `{{ db }}`;\n'
        'GET SUBGRAPH WITH PROP FROM {{ condition.vid }}'
        '{% if(condition.edgeTypes) %}'
        ' OF `{{ condition.edgeTypes }}`'
        '{% endif %}'
        ' {{ condition.direction }} {{ condition.steps }} STEPS\n'
        'YIELD VERTICES AS nodes, EDGES AS edges;',
        handler: (rs, [params]) => rs.rows.length,
      );
}

mixin NgHasDb on Database {
  /// {'name': name}
  @override
  Dialect<Db> get dbOp => Dialect<Db>(
        'DESCRIBE SPACE `{{ name }}`;',
        handler: (rs, [params]) {
          if (rs.rows.isEmpty) return Db();
          var r = rs.rows.first;
          return NgSpaceInfo(
            id: r[0] as int,
            name: r[1] as String,
            partitionNum: r[2] as int,
            replicaFactor: r[3] as int,
            charset: r[4] as String,
            collate: r[5] as String,
            vidType: r[6] as String,
            comment: r[7] as String,
          );
        },
      );

  /// {"db": db}
  @override
  Dialect<void> get clearDbOp => Dialect<void>(
        'USE `{{ db.name }}`;',
        handler: (rs, [params]) {},
      );

  /// {'from': from, 'to': to}
  @override
  Dialect<void> get cloneDbOp => Dialect<void>(
        'CREATE SPACE `{{ to }}` AS `{{ from }}`;',
        handler: (rs, [params]) {},
      );

  /// {"db": db}
  @override
  Dialect<void> get createDbOp => Dialect<void>(
        r'''CREATE SPACE `{{ db.name }}` (
  partition_num = {{ db.partitionNum }},
  replica_factor = {{ db.relicaFactor }},
  vid_type = {% if(db.isString) %}FIXED_STRING({{ db.vidLength }}){% else %}INT64{% endif %}
) COMMENT = "{{ db.comment }}";''',
        handler: (rs, [params]) {},
      );

  /// {'name': name}
  @override
  Dialect<void> get dropDbOp => Dialect<void>(
        'DROP SPACE `{{ name }}`;',
        handler: (rs, [params]) {},
      );
}

class NgDatabase extends GraphDatabase
    with NgHasDb, NgHasTag, NgHasEdge, NgHasManagement, NgHasDataControl {
  NgDatabase(this.conn);

  @override
  Connection conn;

  @override
  Dialect<bool> get pingOp =>
      Dialect("SHOW SPACES", handler: (rs, [params]) => rs.success);

  @override
  ScriptRender get render => (gql, params) {
        var data = _normalizeParams(params);
        return Template.parse(gql, data: data).render();
      };

  static Map<String, dynamic> _normalizeParams(Map<String, dynamic> params) {
    return params.map((k, v) => MapEntry(k, _normalizeValue(v)));
  }

  static dynamic _normalizeValue(dynamic value) {
    if (value == null) return null;
    if (value is Map) {
      return value
          .map((k, v) => MapEntry(k.toString(), _normalizeValue(v)));
    }
    if (value is List) return value.map(_normalizeValue).toList();
    if (value is Set) return value.map(_normalizeValue).toList();
    if (value is String || value is num || value is bool) return value;

    try {
      final json = (value as dynamic).toJson();
      return _normalizeValue(json);
    } catch (_) {
      return value;
    }
  }

  @override
  Dialect<bool> get tablesOp => Dialect<bool>(
        'SHOW TAGS;',
        handler: (rs, [params]) => rs.rows.isNotEmpty,
      );

  @override
  String get versionSupported => '3.6.0';

  /// {"db": db, "index": index}
  @override
  Dialect<double> get createIndexOp => Dialect<double>(
        'USE `{{ db }}`;\n'
        'CREATE {{ index.type }} INDEX IF NOT EXISTS `{{ index.name }}`\n'
        'ON `{{ index.schema }}` (\n'
        '{% for f in index.fields %}'
        '  `{{ f }}`{% if forloop.last == false %}'
        ',\n'
        '{% endif %}'
        '{% endfor %}'
        ');',
        handler: (rs, [params]) => 0.0,
      );

  /// {"db": db, "index": index}
  @override
  Dialect<double> get dropIndexOp => Dialect<double>(
        'USE `{{ db }}`; DROP {{ index.type }} INDEX `{{ index.name }}`;',
        handler: (rs, [params]) => 0.0,
      );

  /// {'space': space, 'type': type, 'schemaName': schemaName, 'props': props}
  @override
  Dialect<List> get indexesOp => Dialect<List>(
        'USE `{{ space }}`; SHOW {{ type }} INDEXES;',
        handler: (rs, [params]) => rs.rows.map((r) {
            if (r.length >= 2) {
              return {'name': r[0], 'schema': r[1]};
            }
            return r[0];
          }).toList(),
        );

  /// {"db": db, "index": index}
  @override
  Dialect<double> get rebuildIndexOp => Dialect<double>(
        'USE `{{ db }}`; REBUILD {{ index.type }} INDEX `{{ index.name }}`;',
        handler: (rs, [params]) => 0.0,
      );

  /// {'db': db}
  @override
  Dialect get refreshStatesOp => Dialect(
        'USE `{{ db }}`; SUBMIT JOB STATS;',
      );
}
