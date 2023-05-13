// Copyright (c) 2023- All nebula_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

import 'dart:math';

import 'package:nebula_dart_gdbc/nebula_dart_gdbc.dart';
import 'package:test/test.dart';

var spaceName = 'ndg_test_${Random().nextInt(100)}';

void main() async {
  PreparedStatement? stmt;
  Connection? conn;
  setUpAll(() async {
    DriverManager.registerDriver(NgDriver());

    conn = await DriverManager.getConnection(
      'gdbc.nebula://127.0.0.1:9669/?space=test',
      username: 'root', // username is optional
      password: 'nebula', // password is optional
    );
  });

  test('test create space', () async {
    await conn?.executeQuery(
      'CREATE SPACE IF NOT EXISTS $spaceName (vid_type=FIXED_STRING(30));',
    );

    await Future.delayed(Duration(seconds: 10));
    print('----------- create space -----------');
    await conn?.executeQuery('use $spaceName;');
  });

  test('test create tag', () async {
    await conn?.executeQuery('CREATE tag `person` (`age` int NULL  )  ');
    await Future.delayed(Duration(seconds: 10));
    print('----------- create tag -----------');
  });

  test('test insert', () async {
    await conn?.executeQuery(
      'INSERT VERTEX person(age) VALUES "张小南":(17)',
    );
    await conn?.executeQuery(
      'INSERT VERTEX person(age) VALUES "吴小极":(18)',
    );
  });

  test('test prepareStatement', () async {
    stmt = await conn?.prepareStatement(
      r'''
        MATCH (n:person) 
        WHERE id(n) == '{name}'
        RETURN n 
        LIMIT 30
    ''',
      render: (p0, p1) => p0.replaceAll('{name}', p1?['name']),
    );
    var rs = await stmt?.executeQuery(params: {'name': '吴小极'});
    expect(rs?.value([0, 0]), '吴小极');
    expect(rs?.value([0, 1, 0]), 18);
    expect(rs?.rows.length, 1);

    rs = await stmt?.executeQuery(params: {'name': '张小南'});
    expect(rs?.value([0, 0]), '张小南');
    expect(rs?.value([0, 1, 0]), 17);
    expect(rs?.rows.length, 1);
  });

  tearDownAll(() async {
    await conn?.executeQuery('DROP SPACE $spaceName;');
    print('----------- tearDown -----------');
    await conn?.close();
  });
}
