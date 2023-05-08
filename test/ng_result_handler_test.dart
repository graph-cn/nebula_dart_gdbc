// Copyright (c) 2023- All nebula_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

import 'dart:convert';
import 'dart:typed_data';

import 'package:nebula_dart_gdbc/gen/nebula_graph/nebula_graph.dart';
import 'package:nebula_dart_gdbc/nebula_dart_gdbc.dart';
import 'package:test/test.dart';

const int ROWS = 2;
const int VALUES = 1;

void main() {
  test('Test Node', () async {
    var ds = DataSet();
    // 将字符串 'n' 转换成 Int8List
    var v = Value()
      ..vVal = (Vertex()
        ..vid = (Value()..iVal = 1)
        ..tags = [
          Tag()
            ..name = Int8List.fromList('testTagName'.codeUnits)
            ..props = {
              Int8List.fromList('testPropName'.codeUnits): Value()..iVal = 1
            }
        ]);

    ds
      ..column_names = [Int8List.fromList('n'.codeUnits)]
      ..setFieldValue(ROWS, <Row>[
        Row()..setFieldValue(VALUES, [v])
      ]);
    NgResultSet result = handleDataSet(ds, null, null);
    print(result);
  });
}
