// Copyright (c) 2023- All nebula_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

// ignore_for_file: equal_elements_in_set, constant_identifier_names

import 'dart:mirrors';
import 'dart:typed_data';

import 'package:nebula_dart_gdbc/gen/nebula_graph/nebula_graph.dart' as ng;
import 'package:nebula_dart_gdbc/nebula_dart_gdbc.dart';
import 'package:test/test.dart';

const int ROWS = 2;
const int VALUES = 1;

const fnKey = Symbol('fnKey');

NgResultSet handleRoot(
    ng.DataSet dataSet, ValueMetaData? meta, int? timezoone) {
  var result = NgResultSet()
    ..rows = []
    ..metas = [];
  meta = meta ?? ValueMetaData();
  result.rows = handleDataSet(dataSet, meta, timezoone);
  result.metas.addAll(meta.submetas);
  return result;
}

void main() {
  test('Test Vertex', () async {
    var data = <String, dynamic>{
      'columns': ['n'],
      'rows': [
        [
          {
            fnKey: vertex,
            'id': 1,
            'tags': [
              {
                'name': 'testTagName',
                'props': {'testPropName': 1}
              }
            ]
          },
        ]
      ]
    };

    ng.DataSet ds = createDs(data);
    NgResultSet result = handleRoot(ds, null, null);
    print(result);
    expectAll([0], GdbTypes.node, 'n', null, result);
    expectAll([0, 0], GdbTypes.int, MetaKey.nodeId, 1, result);
    expectAll([0, 1], GdbTypes.prop, 'testTagName', null, result);
    expectAll([0, 1, 0], GdbTypes.int, 'testPropName', 1, result);
  });

  test('Test Edge', () async {
    var data = <String, dynamic>{
      'columns': ['r'],
      'rows': [
        [
          {
            fnKey: edge,
            'ranking': 1,
            'name': 'testEdgeName',
            'props': {'testPropName': 2},
            'src': 3,
            'dst': 4
          },
        ]
      ]
    };

    ng.DataSet ds = createDs(data);
    NgResultSet result = handleRoot(ds, null, null);
    print(result);
    expectAll([0], GdbTypes.relationship, 'r', null, result);
    expectAll([0, 0], GdbTypes.int, MetaKey.startId, 3, result);
    expectAll([0, 1], GdbTypes.int, MetaKey.relationshipId, 1, result);
    expectAll([0, 2], GdbTypes.int, MetaKey.endId, 4, result);
    expectAll([0, 3], GdbTypes.prop, 'testEdgeName', [2], result);
    expectAll([0, 3, 0], GdbTypes.int, 'testPropName', 2, result);
  });

  test('Test int', () async {
    var data = <String, dynamic>{
      'columns': ['n'],
      'rows': [
        [1]
      ]
    };

    ng.DataSet ds = createDs(data);
    NgResultSet result = handleRoot(ds, null, null);
    print(result);
    expectAll([0], GdbTypes.int, 'n', 1, result);
  });

  test('Test double', () {
    var data = <String, dynamic>{
      'columns': ['dbl'],
      'rows': [
        [1.1]
      ]
    };

    ng.DataSet ds = createDs(data);
    NgResultSet result = handleRoot(ds, null, null);
    print(result);
    expectAll([0], GdbTypes.double, 'dbl', 1.1, result);
  });

  test('Test String', () {
    var data = <String, dynamic>{
      'columns': ['str'],
      'rows': [
        ['test']
      ]
    };

    ng.DataSet ds = createDs(data);
    NgResultSet result = handleRoot(ds, null, null);
    print(result);
    expectAll([0], GdbTypes.string, 'str', 'test', result);
  });

  test('Test Map', () {
    var data = <String, dynamic>{
      'columns': ['map'],
      'rows': [
        [
          {'key': 'value'}
        ]
      ]
    };

    ng.DataSet ds = createDs(data);
    NgResultSet result = handleRoot(ds, null, null);
    print(result);
    expectAll([0], GdbTypes.map, 'map', null, result);
    expectAll([0, 0], GdbTypes.string, 'key', 'value', result);
  });

  test('Test List', () {
    var data = <String, dynamic>{
      'columns': ['list'],
      'rows': [
        [
          {
            fnKey: list,
            'values': ['value']
          }
        ]
      ]
    };

    ng.DataSet ds = createDs(data);
    NgResultSet result = handleRoot(ds, null, null);
    print(result);
    expectAll([0], GdbTypes.list, 'list', ['value'], result);
    expectAll([0, 0], GdbTypes.string, null, 'value', result);
  });

  test('Test Set', () {
    var data = <String, dynamic>{
      'columns': ['set'],
      'rows': [
        [
          {'value', 'value'}
        ]
      ]
    };

    ng.DataSet ds = createDs(data);
    NgResultSet result = handleRoot(ds, null, null);
    expectAll([0], GdbTypes.set, 'set', {'value'}, result);
    expectAll([0, 0], GdbTypes.string, null, 'value', result);
  });

  test('Test n r n2', () {
    var data = <String, dynamic>{
      'columns': ['n', 'r', 'n2'],
      'rows': [
        [
          {
            fnKey: vertex,
            'id': 1,
            'tags': [
              {
                'name': 'testTagName',
                'props': {'testPropName': 11, 'testPropName2': '12'}
              }
            ]
          },
          {
            fnKey: edge,
            'ranking': 2,
            'name': 'testEdgeName',
            'props': {'testPropName': 21},
            'src': 1,
            'dst': 3
          },
          {
            fnKey: vertex,
            'id': 3,
            'tags': [
              {
                'name': 'testTagName',
                'props': {'testPropName': 31}
              }
            ]
          },
        ]
      ]
    };

    ng.DataSet ds = createDs(data);
    NgResultSet result = handleRoot(ds, null, null);
    print(result);
    expectAll([0], GdbTypes.node, 'n', null, result);
    expectAll([0, 0], GdbTypes.int, MetaKey.nodeId, 1, result);
    expectAll([0, 1], GdbTypes.prop, 'testTagName', null, result);
    expectAll([0, 1, 0], GdbTypes.int, 'testPropName', 11, result);
    expectAll([0, 1, 1], GdbTypes.string, 'testPropName2', '12', result);

    expectAll([1], GdbTypes.relationship, 'r', null, result);
    expectAll([1, 0], GdbTypes.int, MetaKey.startId, 1, result);
    expectAll([1, 1], GdbTypes.int, MetaKey.relationshipId, 2, result);
    expectAll([1, 2], GdbTypes.int, MetaKey.endId, 3, result);
    expectAll([1, 3], GdbTypes.prop, "testEdgeName", [21], result);
    expectAll([1, 3, 0], GdbTypes.int, 'testPropName', 21, result);

    expectAll([2], GdbTypes.node, 'n2', null, result);
    expectAll([2, 0], GdbTypes.int, MetaKey.nodeId, 3, result);
    expectAll([2, 1], GdbTypes.prop, 'testTagName', null, result);
    expectAll([2, 1, 0], GdbTypes.int, 'testPropName', 31, result);
  });

  test('Test Path', () {
    var data = <String, dynamic>{
      'columns': ['p'],
      'rows': [
        [
          {
            fnKey: path,
            'startNode': {
              fnKey: vertex,
              'id': 1,
              'tags': [
                {
                  'name': 'startNodeTagName',
                  'props': {'startProp1': 11, 'startProp2': '12'}
                }
              ]
            },
            'steps': [
              {
                fnKey: step,
                "name": "testStepName",
                'endNode': {
                  fnKey: vertex,
                  'id': 3,
                  'tags': [
                    {
                      'name': 'testTagName',
                      'props': {'testPropName': 31}
                    }
                  ]
                },
                'props': {
                  'testPropName': 21,
                  'testPropName2': '22',
                  'testPropName3': 23
                },
              }
            ],
          }
        ]
      ]
    };

    ng.DataSet ds = createDs(data);
    ResultSet result = handleRoot(ds, null, null);
    print(result);

    expectAll([0], GdbTypes.path, 'p', null, result);
    expectAll([0, 0], GdbTypes.node, MetaKey.startNode, null, result);
    expectAll([0, 0, 0], GdbTypes.int, MetaKey.nodeId, 1, result);
    expectAll([0, 0, 1], GdbTypes.prop, 'startNodeTagName', null, result);
    expectAll([0, 0, 1, 0], GdbTypes.int, 'startProp1', 11, result);
    expectAll([0, 0, 1, 1], GdbTypes.string, 'startProp2', '12', result);

    expectAll([0, 1], GdbTypes.list, null, null, result);
    expectAll([0, 1, 0], GdbTypes.step, null, null, result);
    expectAll([0, 1, 0, 0], GdbTypes.node, null, null, result);
    expectAll([0, 1, 0, 0, 0], GdbTypes.int, MetaKey.nodeId, 3, result);
    expectAll([0, 1, 0, 0, 1], GdbTypes.prop, null, null, result);
    expectAll([0, 1, 0, 0, 1, 0], GdbTypes.int, 'testPropName', 31, result);

    expectAll([0, 1, 0, 1], GdbTypes.prop, null, null, result);
    expectAll([0, 1, 0, 1, 0], GdbTypes.int, 'testPropName', 21, result);
    expectAll([0, 1, 0, 1, 1], GdbTypes.string, 'testPropName2', '22', result);
    expectAll([0, 1, 0, 1, 2], GdbTypes.int, 'testPropName3', 23, result);
  });

  // todo 修正 list 层级问题
  test('Test Subgraph', () {
    var data = <String, dynamic>{
      'columns': ['nodes', 'edges'],
      'rows': [
        [
          {
            fnKey: subgraph,
            'nodes': [
              {
                fnKey: vertex,
                'id': 1,
                'tags': [
                  {
                    'name': 'testTagName',
                    'props': {'testPropName': 11}
                  }
                ]
              },
              {
                fnKey: vertex,
                'id': 3,
                'tags': [
                  {
                    'name': 'testTagName',
                    'props': {'testPropName': 31}
                  }
                ]
              },
            ]
          },
          {
            fnKey: subgraph,
            'edges': [
              {
                fnKey: edge,
                'ranking': 1,
                'src': 1,
                'dst': 3,
                'name': 'testEdgeName',
                'props': {'testPropName': 21}
              },
              {
                fnKey: edge,
                'ranking': 1,
                'src': 1,
                'dst': 3,
                'name': 'testEdgeName',
                'props': {'testPropName': 21}
              },
            ],
          }
        ]
      ]
    };

    ng.DataSet ds = createDs(data);
    ResultSet result = handleRoot(ds, null, null);
    print(result);
    var sgRow0Col0 = [
      [
        1,
        [11]
      ],
      [
        3,
        [31]
      ]
    ];
    var sgRow0Col1 = [
      [
        1,
        1,
        3,
        [21]
      ],
      [
        1,
        1,
        3,
        [21]
      ]
    ];
    expectAll([0], GdbTypes.list, 'nodes', sgRow0Col0, result);
    expectAll([0, 0], GdbTypes.node, null, null, result);
    expectAll([0, 0, 0], GdbTypes.int, MetaKey.nodeId, 1, result);
    expectAll([0, 0, 1], GdbTypes.prop, 'testTagName', null, result);
    expectAll([0, 0, 1, 0], GdbTypes.int, 'testPropName', 11, result);

    expectAll([1], GdbTypes.list, 'edges', sgRow0Col1, result);
    expectAll([1, 0], GdbTypes.relationship, null, null, result);
    expectAll([1, 0, 0], GdbTypes.int, MetaKey.startId, 1, result);
    expectAll([1, 0, 1], GdbTypes.int, MetaKey.relationshipId, 1, result);
    expectAll([1, 0, 2], GdbTypes.int, MetaKey.endId, 3, result);
    expectAll([1, 0, 3], GdbTypes.prop, 'testEdgeName', null, result);
    expectAll([1, 0, 3, 0], GdbTypes.int, 'testPropName', 21, result);
  });

  test('Test null', () {
    var data = <String, dynamic>{
      'columns': ['n', 'r', 'n2'],
      'rows': [
        [null, null, null]
      ]
    };

    ng.DataSet ds = createDs(data);
    NgResultSet result = handleRoot(ds, null, null);
    print(result);
    expectAll([0], GdbTypes.none, 'n', null, result);
    expectAll([1], GdbTypes.none, 'r', null, result);
    expectAll([2], GdbTypes.none, 'n2', null, result);
  });

  test('Test Date', () {
    var data = <String, dynamic>{
      'columns': ['_date'],
      'rows': [
        [
          ng.Value()
            ..dVal = (ng.Date()
              ..year = DateTime.now().year
              ..month = DateTime.now().month
              ..day = DateTime.now().day)
        ]
      ]
    };

    ng.DataSet ds = createDs(data);
    NgResultSet result = handleRoot(ds, null, null);
    expectAll(
        [0],
        GdbTypes.date,
        null,
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
        result);
  });

  test('Test Time', () {
    var now = DateTime.now();
    var data = <String, dynamic>{
      'columns': ['_time'],
      'rows': [
        [
          ng.Value()
            ..tVal = (ng.Time()
              ..hour = now.hour
              ..minute = now.minute
              ..sec = now.second
              ..microsec = now.microsecond)
        ]
      ]
    };

    ng.DataSet ds = createDs(data);
    NgResultSet result = handleRoot(ds, null, null);
    expectAll(
        [0],
        GdbTypes.time,
        null,
        DateTime(
          now.hour,
          now.minute,
          now.second,
          now.millisecond,
          now.microsecond,
        ),
        result);
  });
}

void expectAll(
  List<int> col,
  GdbTypes? type,
  String? name,
  dynamic val,
  ResultSet result,
) {
  var meta = result.meta(col);
  if (type != null) {
    expect(meta?.type, type);
  }
  if (name != null) expect(meta?.name, name);
  var v = result.value(col);
  if (val != null) expect(v, val);
}

ng.Value list(dynamic v) {
  var list = List.generate(v['values'].length, (index) {
    return value(v['values'][index]);
  });
  return ng.Value()..lVal = (ng.NList()..values = list);
}

ng.Value edge(dynamic v) {
  var edge = ng.Edge()
    ..ranking = v['ranking']
    ..name = (v['name'] as String).bytes
    ..props = Map.fromEntries(
      ((v['props']).entries as Iterable<MapEntry<String, dynamic>>).map(
        (e) {
          return MapEntry(e.key.bytes, value(e.value));
        },
      ),
    )
    ..src = value(v['src'])
    ..dst = value(v['dst']);
  return ng.Value()..eVal = edge;
}

ng.Value path(dynamic v) {
  var path = ng.Path()
    ..src = vertex(v['startNode']).vVal
    ..steps = List.generate(v['steps'].length, (index) {
      return step(v['steps'][index]);
    });
  return ng.Value()..pVal = path;
}

ng.Step step(dynamic v) {
  var step = ng.Step()
    ..dst = vertex(v['endNode']).vVal
    ..name = (v['name'] as String).bytes
    ..props = Map.fromEntries(
      ((v['props']).entries as Iterable<MapEntry<String, dynamic>>).map(
        (e) {
          return MapEntry(e.key.bytes, value(e.value));
        },
      ),
    );
  return step;
}

ng.Value vertex(dynamic v) {
  var vertex = ng.Vertex()
    ..vid = value(v['id'])
    ..tags = List.generate(v['tags'].length, (index) {
      return ng.Tag()
        ..name = (v['tags'][index]['name'] as String).bytes
        ..props = Map.fromEntries(
          ((v['tags'][index]['props']).entries
                  as Iterable<MapEntry<String, dynamic>>)
              .map<MapEntry<Int8List, ng.Value>>(
            (e) {
              return MapEntry(e.key.bytes, value(e.value));
            },
          ),
        );
    });
  return ng.Value()..vVal = vertex;
}

ng.DataSet createDs(Map<String, dynamic> data) {
  var ds = ng.DataSet();
  // 将字符串 'n' 转换成 Int8List
  ds.column_names =
      (data['columns'] as List<String>).map((e) => (e).bytes).toList();

  ds.rows = data['rows'].map<ng.Row>((e) {
    return ng.Row()
      ..setFieldValue(
        VALUES,
        List<ng.Value>.generate(e.length, (index) {
          var v = e[index];
          if (v is Map && v[fnKey] != null) {
            return v[fnKey](v);
          } else if (v is ng.Value) {
            return v;
          } else {
            return value(v);
          }
        }),
      );
  }).toList();
  return ds;
}

Map<Type, ng.Value Function(dynamic)> tr = {
  String: (v) => ng.Value()..sVal = (v as String).bytes,
  int: (v) => ng.Value()..iVal = v,
  double: (v) => ng.Value()..fVal = v,
  bool: (v) => ng.Value()..bVal = v,
  Map: (v) => ng.Value()
    ..mVal = (ng.NMap()
      ..kvs = Map.fromEntries(
        ((v as Map).entries as Iterable<MapEntry<String, dynamic>>).map(
          (e) {
            return MapEntry(e.key.bytes, value(e.value));
          },
        ),
      )),
  List: (v) => ng.Value()
    ..lVal =
        (ng.NList()..values = (v as Iterable).map((e) => value(e)).toList()),
  Set: (v) => ng.Value()
    ..uVal = (ng.NSet()..values = (v as Iterable).map((e) => value(e)).toSet()),
};

ng.Value value(dynamic v) {
  if (v == null) return ng.Value()..nVal = 0;
  ClassMirror cm = reflectClass(v.runtimeType);
  var k = tr.keys.firstWhere((Type element) {
    return cm.isSubtypeOf(reflectType(element));
  });
  return tr[k]!(v);
}

ng.Value subgraph(dynamic v) {
  if (v['nodes'] != null) {
    return ng.Value()
      ..lVal = (ng.NList()
        ..values = List<ng.Value>.generate(
          v['nodes'].length,
          (index) {
            return vertex(v['nodes'][index]);
          },
        ));
  } else if (v['edges'] != null) {
    return ng.Value()
      ..lVal = (ng.NList()
        ..values = List<ng.Value>.generate(
          v['edges'].length,
          (index) {
            return edge(v['edges'][index]);
          },
        ));
  }
  return ng.Value()..nVal = 0;
}
