## 0.0.1+1
- 支持在创建连接时指定Space（可选）
- 适配dart_gdbc v0.0.1+3
  - 修改了Statement的接口
  - PreparedStatement支持gql参数渲染
- 完善PreparedStatement的带参实现
- 拓展方法
  - string.bytes 获取 Int8List
  - string.utf8code 获取Utf8编码的Int8List
  - int8List.utf8string 获取Utf8编码的String

## 0.0.1

- 提供nebulagraph的驱动