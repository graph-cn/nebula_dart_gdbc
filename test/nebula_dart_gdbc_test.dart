// Copyright (c) 2023- All nebula_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

import 'dart:math';

import 'package:nebula_dart_gdbc/nebula_dart_gdbc.dart';
import 'package:test/test.dart';

void main() async {
  DriverManager.registerDriver(NgDriver());

  var conn = await DriverManager.getConnection(
    'gdbc.nebula://127.0.0.1:9669/?username=root&password=nebula&space=test',
    properties: <String, dynamic>{
      // properties is optional
      DriverManager.usrKey: 'root',
      DriverManager.pwdKey: 'nebula',
      'timeout': 1000,
      'space': 'test',
    },
    username: 'root', // username is optional
    password: 'nebula', // password is optional
  );

  var stmt = await conn.createStatement();

  var spaceKey = Random().nextInt(100);
  var spaceNamePrefix = 'my_space_';

  test('test create space', () async {
    await stmt.executeQuery(
      gql: '''
      CREATE SPACE IF NOT EXISTS $spaceNamePrefix$spaceKey (vid_type=FIXED_STRING(30));
      ''',
    );

    await Future.delayed(Duration(seconds: 10), () async {
      await stmt.executeQuery(gql: 'use $spaceNamePrefix$spaceKey;');
    });
  });

  test('Test List', () async {
    var rs = await stmt.executeQuery(gql: 'RETURN [1, 2, 3] as arr;');
    expect(rs.value([0]), [1, 2, 3]);
    var firstMeta = rs.meta([0]);
    expect(firstMeta?.type, GdbTypes.list);
    expect(firstMeta?.name, 'arr');
  });

  tearDownAll(() async {
    await stmt.executeQuery(
      gql: '''
      DROP SPACE $spaceNamePrefix$spaceKey;
      ''',
    );
    print('----------- tearDown -----------');
    await conn.close();
  });
}
