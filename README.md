## nebula_dart_gdbc
这是一个基于 dart_gdbc 规范下，nebula-graph 图数据库的 dart 客户端实现。（开发中）

## Usage
```dart
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
```
## Licence

nebula_dart_gdbc 遵循 [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0) 开源协议。