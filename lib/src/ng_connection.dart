// Copyright (c) 2023- All nebula_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of nebula_dart_gdbc;

/// Create by [DriverManager.getConnection]
///
/// 通过 [DriverManager.getConnection] 创建
///
/// For example:
/// ```dart
/// DriverManager.getConnection(
///   'gdbc.nebula://127.0.0.1:9669/?username=root&password=nebula&space=nb',
///   properties: {// properties is optional
///     DriverManager.usrKey: 'root',
///     DriverManager.pwdKey: 'nebula',
///     'timeout': '1000',
///     'space': 'nb',
///   },
///   username: 'root', // username is optional
///   password: 'nebula', // password is optional
/// );
/// ```
class NgConnection implements Connection {
  static const String timeoutKey = 'timeout';
  static const String spaceKey = 'space';

  late ng.TSocketTransport socketTransport;
  late ng.TFramedTransport transport;
  late ng.THeaderProtocol protocol;
  late ng.GraphServiceClient client;
  late Map<String, dynamic> properties;
  int? _sessionId;
  int? timezoneOffset;
  int timeout = 0;
  String? space;

  /// Invoked in [DriverManager.getConnection],
  /// you should not call this method directly.
  /// Because connection is not open yet.
  ///
  /// 通过 [DriverManager.getConnection] 调用，
  /// 不应该直接调用这个方法。
  /// 因为连接还没有打开。
  NgConnection._create(Uri address, {Map<String, dynamic>? properties}) {
    this.properties = properties ?? <String, dynamic>{};
    socketTransport = ng.TSocketTransport(
      host: address.host,
      port: address.port,
      connectionTimeout: int.tryParse('${properties?[timeoutKey]}') ?? 6000,
    );

    transport = ng.THeaderTransport(
      transport: socketTransport,
      clientTypes: [ng.ClientTypes.HEADERS],
      supportedClients: [false],
      maxLength: 4194304,
    );

    protocol = ng.THeaderProtocol(transport);
    client = ng.GraphServiceClient(protocol);
  }

  /// Invoked in [DriverManager.getConnection], after the connection created.
  ///
  /// 在 [DriverManager.getConnection] 内创建了连接之后调用。
  Future<void> _open() async {
    if (!socketTransport.isOpen) await socketTransport.open();

    /// check the version of client and server
    await verifyVersion();
    await authencate();

    if (properties.containsKey(spaceKey)) {
      space = properties[spaceKey];
      await executeQuery('USE $space');
    }
  }

  /// check the version of client and server
  /// if the version is not compatible, throw an exception
  ///
  /// 检查客户端和服务端的版本是否兼容
  /// 如果不兼容，抛出异常
  Future<void> verifyVersion() async {
    ng.VerifyClientVersionResp resp =
        await client.verifyClientVersion(ng.VerifyClientVersionReq());

    if (resp.error_code != ng.ErrorCode.SUCCEEDED) {
      throw VersionException(
          message: String.fromCharCodes(resp.error_msg ?? []));
    }
  }

  /// authenticate the user
  ///
  /// 认证用户
  Future<void> authencate() async {
    ng.AuthResponse resp = await client.authenticate(
      Int8List.fromList(utf8.encode(properties[DriverManager.usrKey] ?? '')),
      Int8List.fromList(utf8.encode(properties[DriverManager.pwdKey] ?? '')),
    );

    if (resp.error_code != ng.ErrorCode.SUCCEEDED) {
      if (resp.error_msg != null) {
        throw ConnectException(message: String.fromCharCodes(resp.error_msg!));
      } else {
        throw ConnectException(message: "Auth failed");
      }
    }

    _sessionId = resp.session_id;
    timezoneOffset = resp.time_zone_offset_seconds ?? 0;
  }

  @override
  Future<void> close() async {
    await client.signout(_sessionId ?? 0);
    await transport.close();
  }

  @override
  Future<void> commit() async {}

  @override
  Future<Statement> createStatement() async {
    return NgStatement(this);
  }

  @override
  Future<ResultSet> executeQuery(String gql,
      {Map<String, dynamic>? params}) async {
    var sessionId = _sessionId ?? 0;
    var stmtBytes = Int8List.fromList(utf8.encode(gql));
    ng.ExecutionResponse resp = params == null
        ? await client.execute(sessionId, stmtBytes)
        : await client.executeWithParameter(
            sessionId,
            stmtBytes,
            _convertParams(params),
          );
    if (resp.error_code == ng.ErrorCode.SUCCEEDED) {
      return handleResult(resp, timezoneOffset);
    } else {
      throw GdbcQueryException(message: resp.error_msg?.utf8String());
    }
  }

  @override
  Future<int> executeUpdate(String gql) async {
    return await NgStatement(this).executeUpdate(gql: gql);
  }

  @override
  Future<bool> getAutoCommit() async {
    return true;
  }

  @override
  Future<ResultSetMetaData> getMetaData() {
    // TODO: implement getMetaData
    throw UnimplementedError();
  }

  @override
  Future<bool> isClosed() async {
    return !transport.isOpen;
  }

  @override
  Future<PreparedStatement> prepareStatement(
    String gql, {
    String Function(String, Map<String, dynamic>?)? render,
  }) async {
    return NgPreparedStatement(this, gql: gql, render: render);
  }

  @override
  Future<PreparedStatement> prepareStatementWithParameters(
      String gql, List<ParameterMetaData> parameters) async {
    return NgPreparedStatement(this, parameters: parameters, gql: gql);
  }

  @override
  Future<void> rollback() {
    throw DbFeatureException('No support for rollback');
  }

  @override
  Future<void> setAutoCommit(bool autoCommit) {
    throw DbFeatureException('No support for setAutoCommit');
  }

  Map<Int8List, ng.Value> _convertParams(Map<String, dynamic>? params) {
    if (params == null) return <Int8List, ng.Value>{};
    return params.map((key, value) {
      return MapEntry(key.bytes, _convertParam(value));
    });
  }

  ng.Value _convertParam(value) {
    if (value == null) {
      return ng.Value()..nVal = 0;
    } else if (value is int) {
      return ng.Value()..iVal = value;
    } else if (value is double) {
      return ng.Value()..fVal = value;
    } else if (value is bool) {
      return ng.Value()..bVal = value;
    } else if (value is String) {
      return ng.Value()..sVal = value.utf8code;
    } else if (value is List) {
      return ng.Value()
        ..lVal = (ng.NList()..values = value.map(_convertParam).toList());
    } else if (value is Set) {
      return ng.Value()
        ..uVal = (ng.NSet()..values = value.map(_convertParam).toSet());
    } else if (value is Map<String, dynamic>) {
      return ng.Value()..mVal = (ng.NMap()..kvs = _convertParams(value));
    } else {
      if (value.toJson is! Map<String, dynamic> Function()) {
        throw GdbcQueryException(
          message:
              '''Unsupported type: ${value.runtimeType}, you can define a toJson method for it. such as:
              Map<String, dynamic> toJson() {
                return {
                  'name': name,
                  'age': age,
                };
              }
              ''',
        );
      }
      Map<String, dynamic> jsonValue = value.toJson();
      return _convertParam(jsonValue);
    }
  }
}
