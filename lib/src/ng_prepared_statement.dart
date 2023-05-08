// Copyright (c) 2023- All nebula_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of nebula_dart_gdbc;

class NgPreparedStatement extends NgStatement implements PreparedStatement {
  List<ParameterMetaData>? parameters;
  NgPreparedStatement(super.conn, {this.parameters});

  @override
  Future<bool> execute([String? gql, Map<String, dynamic>? params]) async {
    var rs = await executeQuery(gql, params);
    return rs.success;
  }

  @override
  Future<ResultSet> executeQuery(
      [String? gql, Map<String, dynamic>? params]) async {
    return super.executeQuery(gql);
  }

  @override
  Future<int> executeUpdate(String? gql, [Map<String, dynamic>? params]) async {
    return super.executeUpdate(gql);
  }
}
