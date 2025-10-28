## 0.0.6

- 在`Connection`类成员中添加`onClose`回调函数
  > - Feat: Add `onClose` callback to `Connection` to allow custom cleanup logic when the connection is closed.


## 0.0.5+2
- fix: 升级依赖，修复脚本写入时，缓存区长度不足的问题
  > - fix: Upgrade dependencies to fix the problem of insufficient buffer length when writing scripts.

## 0.0.5+1
- fix: 修复 INT64 在超出 4611686018427387904 时的值溢出问题。
  > - fix: the value overflow problem when INT64 exceeds 4611686018427387904.
- fix: 接收包的数据帧最大长度设置为 fbthrift 默认的 2147483647.
  > - fix: The maximum length of the data frame of the received packet is set to the default 2147483647 of fbthrift.

## 0.0.5
- feat: NgConnection 支持 databaseName 参数与 version 参数
  > - feat: NgConnection supports databaseName parameter and version parameter
- fix: 修复 geo 类型的数据解析问题
  > - fix: Fix the data parsing problem of the geo type

## 0.0.4+6
- fix: 修复关系的方向性问题，使 _srcId 与 _dstId 两个栏位的值符合方向性.
  > - fix: Fix the directionality problem of the relationship, so that the values of the two columns _srcId and _dstId conform to the directionality.

## 0.0.4+5
- chore: upgrade dependencies.

## 0.0.4+4
- fix: 修复 meta 名称为中文时，无法获取到数据的问题
> fix: When the meta name is Chinese, the data cannot be obtained

## 0.0.4+3
- fix: when the data is not a standard utf8 string, an error occurs.

## 0.0.4+2
- fix: when the time zone of the database is set, fix the unit issue of offset (hours ->sec)

## 0.0.4+1
- fix: path data processing errors.

## 0.0.4
- Feat: Add timestamp type in dart_gdbc ( upgrade to v0.0.4 ).

## 0.0.3+4
- 修复：获取 Time 类型的值错误问题

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