// Copyright (c) 2023- All nebula_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of nebula_dart_gdbc;

class NgPreparedStatement extends NgStatement implements PreparedStatement {
  List<ParameterMetaData>? parameters;
  String gql;
  String Function(String, Map<String, dynamic>?)? render;

  NgPreparedStatement(super.conn,
      {this.parameters, required this.gql, this.render});

  @override
  Future<bool> execute({String? gql, Map<String, dynamic>? params}) async {
    var rs = await executeQuery(gql: gql, params: params);
    return rs.success;
  }

  @override
  Future<ResultSet> executeQuery(
      {String? gql, Map<String, dynamic>? params}) async {
    if (params != null && render != null) {
      gql = render?.call(gql ?? this.gql, params);
    }
    return super.executeQuery(gql: gql ?? this.gql, params: params);
  }

  @override
  Future<int> executeUpdate({String? gql, Map<String, dynamic>? params}) async {
    return super.executeUpdate(gql: gql, params: params);
  }
}
