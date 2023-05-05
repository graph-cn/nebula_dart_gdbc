part of nebula_dart_gdbc;

class NgStatement implements Statement {
  NgConnection _conn;

  NgStatement(this._conn);

  @override
  Future<bool> execute([String? gql]) {
    // TODO: implement execute
    throw UnimplementedError();
  }

  @override
  Future<ResultSet> executeQuery([String? gql]) async {
    ExecutionResponse resp = await _conn.client.execute(
        _conn._sessionId ?? 0, Int8List.fromList(utf8.encode(gql ?? '')));
    if (resp.error_code == ErrorCode.SUCCEEDED) {
      return NgResultSet();
    } else {
      print(utf8.decode(resp.error_msg ?? []));
      throw GdbcQueryException(message: utf8.decode(resp.error_msg ?? []));
    }
  }

  @override
  Future<int> executeUpdate(String? gql) {
    // TODO: implement executeUpdate
    throw UnimplementedError();
  }
}
