// Copyright (c) 2023- All nebula_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

// ignore_for_file: prefer_final_fields

part of "../nebula_dart_gdbc.dart";

class NgStatement implements Statement {
  NgConnection _conn;

  NgStatement(this._conn);

  @override
  Future<bool> execute({Map<String, dynamic>? params, String? gql}) async {
    var rs = await executeQuery(gql: gql);
    return rs.success;
  }

  @override
  Future<ResultSet> executeQuery(
      {Map<String, dynamic>? params, String? gql}) async {
    if (gql == null) {
      throw GdbcQueryException(message: 'gql is null');
    }
    return await _conn.executeQuery(gql, params: params);
  }

  @override
  Future<int> executeUpdate({Map<String, dynamic>? params, String? gql}) {
    // TODO: implement executeUpdate
    throw UnimplementedError();
  }
}
