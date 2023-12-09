// Copyright (c) 2023- All nebula_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../nebula_dart_gdbc.dart";

class NgResultSet extends ResultSet {
  @override
  late List<ValueMetaData> metas;

  @override
  late List<List<dynamic>> rows;
}
