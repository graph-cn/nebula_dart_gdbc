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

  late ng.TSocketTransport socketTransport;
  late ng.TFramedTransport transport;
  late ng.THeaderProtocol protocol;
  late ng.GraphServiceClient client;
  late Map<String, dynamic> properties;
  int? _sessionId;
  int? timezoneOffset;
  int timeout = 0;

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
        supportedClients: [false]);

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
    await transport.close();
  }

  @override
  Future<void> commit() async {}

  @override
  Future<Statement> createStatement() async {
    return NgStatement(this);
  }

  @override
  Future<ResultSet> executeQuery(String gql) async {
    return await NgStatement(this).executeQuery(gql);
  }

  @override
  Future<int> executeUpdate(String gql) async {
    return await NgStatement(this).executeUpdate(gql);
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
  Future<PreparedStatement> prepareStatement(String gql) async {
    return NgPreparedStatement(this);
  }

  @override
  Future<PreparedStatement> prepareStatementWithParameters(
      String gql, List<ParameterMetaData> parameters) async {
    return NgPreparedStatement(this, parameters: parameters);
  }

  @override
  Future<void> rollback() {
    throw DbFeatureException('No support for rollback');
  }

  @override
  Future<void> setAutoCommit(bool autoCommit) {
    throw DbFeatureException('No support for setAutoCommit');
  }
}
