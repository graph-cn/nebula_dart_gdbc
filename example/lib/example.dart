// use driver

import 'package:nebula_dart_gdbc/nebula_dart_gdbc.dart';

void main(List<String> args) async {
  // 注册驱动
  DriverManager.registerDriver(NgDriver());
  // 获取连接
  var conn = await DriverManager.getConnection(
    'gdbc.nebula://127.0.0.1:9669/?space=test',
    username: 'root', // username is optional
    password: 'nebula', // password is optional
  );

  // 创建语句
  var stmt = await conn.createStatement();
  // 执行语句
  var rs = await stmt.executeQuery(gql: 'SHOW SPACES;');
  // 打印结果
  print(rs);
  // 关闭连接
  conn.close();
}
