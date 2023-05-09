// Copyright (c) 2023- All nebula_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

import 'dart:mirrors';
import 'dart:typed_data';

import 'package:nebula_dart_gdbc/gen/nebula_graph/nebula_graph.dart';
import 'package:nebula_dart_gdbc/nebula_dart_gdbc.dart';
import 'package:test/test.dart';

const int ROWS = 2;
const int VALUES = 1;

const fnKey = Symbol('fnKey');

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

    DataSet ds = createDs(data);
    NgResultSet result = handleDataSet(ds, null, null);
    print(result);
    expectAll([0], GdbTypes.node, 'n', null, result);
    expectAll([0, 0], GdbTypes.int, MetaKey.nodeId, 1, result);
    expectAll([0, 1], GdbTypes.tag, 'testTagName', null, result);
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

    DataSet ds = createDs(data);
    NgResultSet result = handleDataSet(ds, null, null);
    print(result);
    expectAll([0], GdbTypes.relationship, 'r', null, result);
    expectAll([0, 0], GdbTypes.int, MetaKey.startId, 3, result);
    expectAll([0, 1], GdbTypes.int, MetaKey.relationshipId, 1, result);
    expectAll([0, 2], GdbTypes.int, MetaKey.endId, 4, result);
    expectAll([0, 3, 0], GdbTypes.int, 'testPropName', 2, result);
  });

  test('Test int', () async {
    var data = <String, dynamic>{
      'columns': ['n'],
      'rows': [
        [1]
      ]
    };

    DataSet ds = createDs(data);
    NgResultSet result = handleDataSet(ds, null, null);
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

    DataSet ds = createDs(data);
    NgResultSet result = handleDataSet(ds, null, null);
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

    DataSet ds = createDs(data);
    NgResultSet result = handleDataSet(ds, null, null);
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

    DataSet ds = createDs(data);
    NgResultSet result = handleDataSet(ds, null, null);
    print(result);
    expectAll([0], GdbTypes.map, 'map', null, result);
    expectAll([0, 0], GdbTypes.string, 'key', 'value', result);
  });

  test('Test List', () {
    var data = <String, dynamic>{
      'columns': ['list'],
      'rows': [
        [
          ['value']
        ]
      ]
    };

    DataSet ds = createDs(data);
    NgResultSet result = handleDataSet(ds, null, null);
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

    DataSet ds = createDs(data);
    NgResultSet result = handleDataSet(ds, null, null);
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

    DataSet ds = createDs(data);
    NgResultSet result = handleDataSet(ds, null, null);
    print(result);
    expectAll([0], GdbTypes.node, 'n', null, result);
    expectAll([0, 0], GdbTypes.int, MetaKey.nodeId, 1, result);
    expectAll([0, 1], GdbTypes.tag, 'testTagName', null, result);
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
    expectAll([2, 1], GdbTypes.tag, 'testTagName', null, result);
    expectAll([2, 1, 0], GdbTypes.int, 'testPropName', 31, result);
  });

  // TODO this test is not working
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

    DataSet ds = createDs(data);
    ResultSet result = handleDataSet(ds, null, null);
    print(result);

    expectAll([0], GdbTypes.path, 'p', null, result);
    expectAll([0, 0], GdbTypes.node, MetaKey.startNode, null, result);
    expectAll([0, 0, 0], GdbTypes.int, MetaKey.nodeId, 1, result);
    expectAll([0, 0, 1], GdbTypes.tag, 'startNodeTagName', null, result);
    expectAll([0, 0, 1, 0], GdbTypes.int, 'startProp1', 11, result);
    expectAll([0, 0, 1, 1], GdbTypes.string, 'startProp2', '12', result);

    expectAll([0, 1], GdbTypes.list, null, null, result);
    expectAll([0, 1, 0], GdbTypes.step, 'testStepName', null, result);
    expectAll([0, 1, 0, 0], GdbTypes.int, MetaKey.nodeId, 3, result);
    expectAll([0, 1, 0, 1], GdbTypes.tag, 'testTagName', null, result);
    expectAll([0, 1, 0, 1, 0], GdbTypes.int, 'testPropName', 31, result);

    expectAll([0, 1, 0, 2], GdbTypes.int, 'testPropName', 21, result);
    expectAll([0, 1, 0, 3], GdbTypes.string, 'testPropName2', '22', result);
    expectAll([0, 1, 0, 4], GdbTypes.int, 'testPropName3', 23, result);
  });

  test('Test null', () {
    var data = <String, dynamic>{
      'columns': ['n', 'r', 'n2'],
      'rows': [
        [null, null, null]
      ]
    };

    DataSet ds = createDs(data);
    NgResultSet result = handleDataSet(ds, null, null);
    print(result);
    expectAll([0], GdbTypes.none, 'n', null, result);
    expectAll([1], GdbTypes.none, 'r', null, result);
    expectAll([2], GdbTypes.none, 'n2', null, result);
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

Value edge(dynamic v) {
  var edge = Edge()
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
  return Value()..eVal = edge;
}

Value path(dynamic v) {
  var path = Path()
    ..src = vertex(v['startNode']).vVal
    ..steps = List.generate(v['steps'].length, (index) {
      return step(v['steps'][index]);
    });
  return Value()..pVal = path;
}

Step step(dynamic v) {
  var step = Step()
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

Value vertex(dynamic v) {
  var vertex = Vertex()
    ..vid = value(v['id'])
    ..tags = List.generate(v['tags'].length, (index) {
      return Tag()
        ..name = (v['tags'][index]['name'] as String).bytes
        ..props = Map.fromEntries(
          ((v['tags'][index]['props']).entries
                  as Iterable<MapEntry<String, dynamic>>)
              .map<MapEntry<Int8List, Value>>(
            (e) {
              return MapEntry(e.key.bytes, value(e.value));
            },
          ),
        );
    });
  return Value()..vVal = vertex;
}

DataSet createDs(Map<String, dynamic> data) {
  var ds = DataSet();
  // 将字符串 'n' 转换成 Int8List
  ds.column_names =
      (data['columns'] as List<String>).map((e) => (e).bytes).toList();

  ds.rows = data['rows'].map<Row>((e) {
    return Row()
      ..setFieldValue(
        VALUES,
        List<Value>.generate(e.length, (index) {
          var v = e[index];
          if (v is Map && v[fnKey] != null) {
            return v[fnKey](v);
          } else {
            return value(v);
          }
        }),
      );
  }).toList();
  return ds;
}

extension StringExt on String {
  Int8List get bytes => Int8List.fromList(codeUnits);
}

Map<Type, Value Function(dynamic)> tr = {
  String: (v) => Value()..sVal = (v as String).bytes,
  int: (v) => Value()..iVal = v,
  double: (v) => Value()..fVal = v,
  bool: (v) => Value()..bVal = v,
  Map: (v) => Value()
    ..mVal = (NMap()
      ..kvs = Map.fromEntries(
        ((v as Map).entries as Iterable<MapEntry<String, dynamic>>).map(
          (e) {
            return MapEntry(e.key.bytes, value(e.value));
          },
        ),
      )),
  List: (v) => Value()
    ..lVal = (NList()..values = (v as Iterable).map((e) => value(e)).toList()),
  Set: (v) => Value()
    ..uVal = (NSet()..values = (v as Iterable).map((e) => value(e)).toSet()),
};

Value value(dynamic v) {
  if (v == null) return Value()..nVal = 0;
  ClassMirror cm = reflectClass(v.runtimeType);
  var k = tr.keys.firstWhere((Type element) {
    return cm.isSubtypeOf(reflectType(element));
  });
  return tr[k]!(v);
}
