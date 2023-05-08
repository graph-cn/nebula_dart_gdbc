// Copyright (c) 2023- All nebula_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of nebula_dart_gdbc;

class NgStatement implements Statement {
  NgConnection _conn;

  NgStatement(this._conn);

  @override
  Future<bool> execute([String? gql]) async {
    var rs = await executeQuery(gql);
    return rs.success;
  }

  @override
  Future<ResultSet> executeQuery([String? gql]) async {
    ng.ExecutionResponse resp = await _conn.client.execute(
        _conn._sessionId ?? 0, Int8List.fromList(utf8.encode(gql ?? '')));
    if (resp.error_code == ng.ErrorCode.SUCCEEDED) {
      return handleResult(resp, _conn.timezoneOffset);
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
