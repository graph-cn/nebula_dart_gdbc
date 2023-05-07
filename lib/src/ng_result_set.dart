part of '../nebula_dart_gdbc.dart';

class NgResultSet extends ResultSet {
  bool success = false;

  @override
  late List<ValueMetaData> metas;

  @override
  late List<List<dynamic>> rows;
}
