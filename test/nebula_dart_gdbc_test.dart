// Copyright (c) 2023- All nebula_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

import 'package:nebula_dart_gdbc/nebula_dart_gdbc.dart';
import 'package:test/test.dart';

void main() {
  test('Test url configuration.', () async {
    DriverManager.registerDriver(NgDriver());

    var conn = await DriverManager.getConnection(
      'gdbc.nebula://127.0.0.1:9669/?username=root&password=nebula&space=test&timeout=1000',
    );

    var stmt = await conn.createStatement();
    var rs = await stmt.executeQuery('SHOW SPACES;');

    print(rs);
    await conn.close();
  });

  test('Test username and password configuration.', () async {
    DriverManager.registerDriver(NgDriver());

    var conn = await DriverManager.getConnection(
      'gdbc.nebula://127.0.0.1:9669',
      username: 'root', // username is optional | 可选值
      password: 'nebula', // password is optional | 可选值
    );

    var stmt = await conn.createStatement();
    var rs = await stmt.executeQuery('SHOW SPACES;');

    print(rs);
    await conn.close();
  });

  test("Test properties configuration", () async {
    DriverManager.registerDriver(NgDriver());

    var conn = await DriverManager.getConnection(
      'gdbc.nebula://127.0.0.1:9669/',
      properties: <String, dynamic>{
        // properties is optional | 可选值
        DriverManager.usrKey: 'root',
        DriverManager.pwdKey: 'nebula',
        'timeout': 1000,
        'space': 'test',
      },
    );

    var stmt = await conn.createStatement();
    var rs = await stmt.executeQuery('SHOW SPACES;');

    print(rs);
    await conn.close();
  });

  test('Test all configurations.', () async {
    DriverManager.registerDriver(NgDriver());

    var conn = await DriverManager.getConnection(
      'gdbc.nebula://127.0.0.1:9669/?username=root&password=nebula&space=test',
      properties: <String, dynamic>{
        // properties is optional | 可选值
        DriverManager.usrKey: 'root',
        DriverManager.pwdKey: 'nebula',
        'timeout': 1000,
        'space': 'test',
      },
      username: 'root', // username is optional | 可选值
      password: 'nebula', // password is optional | 可选值
    );

    var stmt = await conn.createStatement();
    var rs = await stmt.executeQuery('SHOW SPACES;');

    print(rs);
    await conn.close();
  });
}
