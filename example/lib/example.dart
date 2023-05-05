// use driver

import 'package:nebula_dart_gdbc/nebula_dart_gdbc.dart';

void main(List<String> args) async {
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
  await conn.executeQuery('use test');
  var rs = await stmt.executeQuery('MATCH (n) RETURN n LIMIT 10;');

  print(rs);
  await conn.close();
}
