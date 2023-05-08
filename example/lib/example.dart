// use driver

import 'package:nebula_dart_gdbc/nebula_dart_gdbc.dart';

void main(List<String> args) async {
  DriverManager.registerDriver(NgDriver());

  var conn = await DriverManager.getConnection(
    'gdbc.nebula://127.0.0.1:9669/?username=root&password=nebula&space=test&timeout=1000',
  );

  var stmt = await conn.createStatement();
  var rs = await stmt.executeQuery('SHOW SPACES;');

  print(rs);
  await conn.close();
}
