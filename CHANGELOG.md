## 0.0.3+3
- 修复：修复DateTime类型的毫秒时间差

## 0.0.3+2
- 修复：结果解析中，对 none 类型进行处理，并按 nVal 的值进行解析，给出对空值的解释，如：BAD_TYPE

## 0.0.3
- 新特性：支持获取执行计划

## 0.0.2+4
- 升级依赖库

## 0.0.2+3
- 修复：当出现未知类型时，返回null，原来是 Value() 

## 0.0.2+2
### Bug修复
- 连接未关闭的问题

## 0.0.2
### 新特性
- 支持连接池

## 0.0.1+3
### Bug修复
- 升级依赖库，解决读写双向数据过小问题的bug

## 0.0.1+2
### Bug修复
- 在 list 类型的结构下，确保多行公用 list 的 submetas，从而避免重复创建多余的 submeta，减少不必要的列。


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