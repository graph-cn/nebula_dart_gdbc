## 0.0.1+1
- 支持在创建连接如指定了默认的space，则自动使用该space
- 适配dart_gdbc v0.0.1+3
  - 修改了Statement的接口
  - PreparedStatement支持gql参数渲染回调函数
    ```dart
      stmt = await conn?.prepareStatement(
        'MATCH (n:person)  WHERE id(n) == '{name}' RETURN n  LIMIT 30',
        render: (gql, param) => gql.replaceAll('{name}', param?['name']), // 可以自行指定顺手的字符串模板来替换
      );

      var rs = await stmt?.executeQuery(params: {'name': '张小南'});
      rs  = await stmt?.executeQuery(params: {'name': '吴小极'});
    ```
- 完善PreparedStatement的带参实现
- 拓展方法
  - string.bytes 获取 Int8List
  - string.utf8code 获取Utf8编码的Int8List
  - int8List.utf8string 获取Utf8编码的String

## 0.0.1

- 提供nebulagraph的驱动