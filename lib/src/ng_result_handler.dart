// Copyright (c) 2023- All nebula_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../nebula_dart_gdbc.dart";

NgResultSet handleResult(ng.ExecutionResponse rs, int? timezoneOffset) {
  ValueMetaData? meta = ValueMetaData();
  var rows = _handleValue(rs.data, meta, timezoneOffset);
  NgResultSet result = NgResultSet()
    ..success = rs.error_code == ng.ErrorCode.SUCCEEDED
    ..rows = rows ?? []
    ..metas = meta.submetas;
  handleExecutionPlan(rs, result);
  return result;
}

dynamic handleExecutionPlan(ng.ExecutionResponse rs, NgResultSet result) {
  ng.PlanDescription? desc = rs.plan_desc;
  if (desc == null) return;

  ExecutionPlan plan = ExecutionPlan()
    ..format = desc.format?.utf8String()
    ..nodeIndexMap = desc.node_index_map
    ..optimizeTimeInUs = desc.optimize_time_in_us
    ..nodes = desc.plan_node_descs?.map((e) {
      ExecutionPlanNode node = ExecutionPlanNode()
        ..id = e.id
        ..name = e.name?.utf8String()
        ..dependencies = e.dependencies
        ..description = e.description?.map((e) {
          return ExecutionPlanNodeDesc(
              name: e.key?.utf8String(), value: e.value?.utf8String());
        }).toList()
        ..outputVar = e.output_var?.utf8String()
        ..profiles = e.profiles?.map((e) {
          return ExecutionPlanNodeProfile()
            ..rows = e.rows
            ..execDurationInUs = e.exec_duration_in_us
            ..totalDurationInUs = e.total_duration_in_us
            ..otherStats = e.other_stats?.map((key, value) {
              return MapEntry(key.utf8String(), value.utf8String());
            });
        }).toList();
      return node;
    }).toList();

  result.plan = plan;
}

Map<GdbTypes, bool Function(dynamic)> typeGetter = {
  GdbTypes.none: (v) => (v is ng.Value && v.isSetNVal()) || v == null,
  GdbTypes.prop: (v) => v is Map<Int8List, ng.Value>,
  GdbTypes.node: (v) => v is ng.Vertex || (v is ng.Value && v.vVal != null),
  GdbTypes.relationship: (v) => v is ng.Value && v.eVal != null,
  GdbTypes.path: (v) => v is ng.Value && v.pVal != null,

  GdbTypes.step: (v) => v is ng.Step,
  GdbTypes.dataSet: (v) => v is ng.DataSet,

  GdbTypes.list: (v) => v is List || (v is ng.Value && v.lVal != null),
  GdbTypes.map: (v) => v is ng.Value && v.mVal != null,
  GdbTypes.set: (v) => v is ng.Value && v.uVal != null,

  GdbTypes.bool: (v) => v is ng.Value && v.bVal != null,
  GdbTypes.int: (v) => v is ng.Value && v.iVal != null,
  GdbTypes.double: (v) => v is ng.Value && v.fVal != null,

  GdbTypes.string: (v) => v is ng.Value && v.sVal != null,
  GdbTypes.bytes: (v) => v is ng.Value && v.bVal != null,

  GdbTypes.date: (v) => v is ng.Value && v.dVal != null,
  GdbTypes.time: (v) => v is ng.Value && v.tVal != null,
  GdbTypes.dateTime: (v) => v is ng.Value && v.dtVal != null,
  GdbTypes.duration: (v) => v is ng.Value && v.duVal != null,

  GdbTypes.geo: (v) => v is ng.Value && v.ggVal != null,
  GdbTypes.line: (v) => v is ng.LineString,
  GdbTypes.point: (v) => v is ng.Point,
  GdbTypes.polygon: (v) => v is ng.Polygon,

  // must at last
  GdbTypes.unknown: (v) => true,
};

typedef NameGetter = String? Function(int, dynamic)?;
typedef TypeHandler = dynamic Function(
    dynamic, ValueMetaData, int?, NameGetter);

Map<GdbTypes, TypeHandler> typeHandler = {
  GdbTypes.none: (v, m, t, nget) =>
      v?.nVal == 0 ? null : ng.NullType.VALUES_TO_NAMES[v?.nVal],
  GdbTypes.prop: (v, m, t, nget) => _handleProp(v, m, t),
  GdbTypes.node: (v, m, t, nget) =>
      _handleNode(v is ng.Vertex ? v : v.vVal, m, t),
  GdbTypes.relationship: (v, m, t, nget) => _handleRelationship(v.eVal, m, t),
  GdbTypes.path: (v, m, t, nget) => _handlePath(v.pVal, m, t),
  //
  GdbTypes.step: (v, m, t, nget) => _handleStep(v, m, t),
  GdbTypes.dataSet: (v, m, t, nget) => handleDataSet(v, m, t),
  //
  GdbTypes.list: (v, m, t, nget) =>
      _handleList(v is List ? v : v.lVal?.values, m, t, nget),
  GdbTypes.map: (v, m, t, nget) => _handleMap(v.mVal, m, t),
  GdbTypes.set: (v, m, t, nget) => _handleSet(v.uVal, m, t, nget),
  //
  GdbTypes.bool: (v, m, t, nget) => v.bVal,
  GdbTypes.int: (v, m, t, nget) => v.iVal,
  GdbTypes.double: (v, m, t, nget) => v.fVal,
  //
  GdbTypes.string: (v, m, t, nget) => (v.sVal as Int8List?)?.utf8String(),
  GdbTypes.bytes: (v, m, t, nget) => throw UnimplementedError(), // TODO
  //
  GdbTypes.date: (v, m, t, nget) => _handleDate(v.dVal, m, t),
  GdbTypes.time: (v, m, t, nget) => _handleTime(v.tVal, m, t),
  GdbTypes.dateTime: (v, m, t, nget) => _handleDateTime(v.dtVal, m, t),
  GdbTypes.duration: (v, m, t, nget) => _handleDuration(v.duVal, m, t),

  GdbTypes.geo: (v, m, t, nget) => _handleGeo(v, m),
  GdbTypes.line: (v, m, t, nget) => _handleLine(v, m),
  GdbTypes.point: (v, m, t, nget) => _handlePoint(v, m),
  GdbTypes.polygon: (v, m, t, nget) => _handlePolygon(v, m),

  // must at last
  GdbTypes.unknown: (v, m, t, nget) => null,
};

handleDataSet(ng.DataSet? dataSet, ValueMetaData meta, int? timezoneOffset) {
  if (dataSet == null) {
    return [];
  }
  var rows = [];
  var cols = dataSet.column_names;
  meta.submetas.addAll(
    cols
            ?.map(
              (e) => ValueMetaData()
                ..name = utf8.decode(e)
                ..type = GdbTypes.unknown,
            )
            .toList() ??
        [],
  );

  rows = dataSet.rows
          ?.map((row) => List<dynamic>.filled(cols?.length ?? 0, null))
          .toList() ??
      [];

  for (var r = 0; r < (dataSet.rows?.length ?? 0); r++) {
    for (var c = 0; c < (cols?.length ?? 0); c++) {
      var value = dataSet.rows?[r].values?[c];
      var submeta = meta.submetas[c];
      rows[r][c] = _handleValue(value!, submeta, timezoneOffset);
    }
  }
  return rows;
}

_handleProp(
  Map<Int8List, ng.Value> props,
  ValueMetaData meta,
  int? timezoneOffset,
) {
  var propsVal = [];
  props.forEach((key, value) {
    var submeta = ValueMetaData()..name = key.utf8String();
    var val = _handleValue(value, submeta, timezoneOffset);
    meta.addSubmeta(submeta, propsVal, val);
  });
  return propsVal;
}

List<dynamic> _handleNode(
    ng.Vertex v, ValueMetaData meta, int? timezoneOffset) {
  var nodeData = [];

  // handle id
  ValueMetaData idMeta = ValueMetaData()..name = MetaKey.nodeId;
  var idVal = _handleValue(v.vid!, idMeta, timezoneOffset);
  meta.addSubmeta(idMeta, nodeData, idVal);

  // handle tags
  for (var i = 0; i < (v.tags?.length ?? 0); i++) {
    ValueMetaData tagMeta = ValueMetaData()
      ..name = v.tags![i].name?.utf8String();
    var tagVal = _handleValue(v.tags![i].props, tagMeta, timezoneOffset);
    meta.addSubmeta(tagMeta, nodeData, tagVal);
  }

  return nodeData;
}

List<dynamic> _handleRelationship(
    ng.Edge v, ValueMetaData meta, int? timezoneOffset) {
  var edgeData = [];
  ValueMetaData startNodeId = ValueMetaData()..name = MetaKey.startId;
  _handleValue(v.src, startNodeId, timezoneOffset,
      parent: meta, parentVal: edgeData);

  ValueMetaData idMeta = ValueMetaData()
    ..name = MetaKey.relationshipId
    ..type = GdbTypes.int;
  _handleValue(ng.Value()..iVal = v.ranking, idMeta, timezoneOffset,
      parent: meta, parentVal: edgeData);

  ValueMetaData endNodeId = ValueMetaData()..name = MetaKey.endId;
  _handleValue(v.dst, endNodeId, timezoneOffset,
      parent: meta, parentVal: edgeData);

  ValueMetaData edgeMeta = ValueMetaData()..name = v.name?.utf8String();
  _handleValue(v.props, edgeMeta, timezoneOffset,
      parent: meta, parentVal: edgeData);

  return edgeData;
}

/// Due to the large differences in the probability of meta in the multi row data of the path.
/// <br>Therefore, the meta of each row of data is stored separately and no longer separated into a unified vertical column
///
/// 由于 path 的多行数据在大概率上，meta 存在很大的差异
/// <br>因此，每行数据的 meta 单独存储，不再抽离成统一的纵向栏位
_handlePath(ng.Path path, ValueMetaData meta, int? timezoneOffset) {
  /// 列转行，数据解析时，需按行的逻辑进行解析
  var pathMeta = ValueMetaData()..type = GdbTypes.list;

  var pathData = <dynamic>[];

  ValueMetaData startNode = ValueMetaData()..name = '0';
  _handleValue(path.src!, startNode, timezoneOffset,
      parent: pathMeta, parentVal: pathData);

  path.steps?.forEach((element) {});
  var srcId = path.src?.vid;
  for (var i = 0; i < (path.steps?.length ?? 0); i++) {
    var step = path.steps?[i];

    ValueMetaData edgeMeta = ValueMetaData();
    var edge = ng.Value()
      ..eVal = (ng.Edge()
        ..name = step?.name
        ..src = srcId
        ..ranking = step?.ranking ?? 0
        ..dst = step?.dst?.vid
        ..props = step?.props);

    _handleValue(edge, edgeMeta, timezoneOffset,
        parent: pathMeta, parentVal: pathData);

    ValueMetaData endNodeMeta = ValueMetaData()
      ..name = '${MetaKey.endNode}${i + 1}';
    _handleValue(step?.dst, endNodeMeta, timezoneOffset,
        parent: pathMeta, parentVal: pathData);
    srcId = step?.dst?.vid;
    edgeMeta.name = '${i + 1}';
    endNodeMeta.name = '${i + 1}';
  }
  var result = NgResultSet()
    ..metas = pathMeta.submetas
    ..rows = [pathData];
  return result;
}

_handleStep(ng.Step v, ValueMetaData meta, int? timezoneOffset) {
  var step = <dynamic>[];

  ValueMetaData nodeMeta = ValueMetaData();
  _handleValue(v.dst, nodeMeta, timezoneOffset, parent: meta, parentVal: step);

  ValueMetaData propMeta = ValueMetaData()..name = v.name?.utf8String();
  _handleValue(v.props, propMeta, timezoneOffset,
      parent: meta, parentVal: step);

  return step;
}

dynamic _handleValue(
  dynamic v,
  ValueMetaData meta,
  int? timezoneOffset, {
  ValueMetaData? parent,
  List? parentVal,
  NameGetter? nameGetter,
}) {
  var type = typeGetter.entries.firstWhere((getter) => getter.value(v)).key;
  meta.type = type;
  var val = typeHandler[type]?.call(v, meta, timezoneOffset, nameGetter);
  parent?.addSubmeta(meta, parentVal, val);
  return val;
}

DateTime _handleDateTime(
  ng.DateTime v,
  ValueMetaData meta,
  int? timezoneOffset,
) {
  return DateTime(
    v.year,
    v.month,
    v.day,
    v.hour,
    v.minute,
    v.sec + (timezoneOffset ?? 0),
    0,
    v.microsec,
  );
}

/// 为保持毫秒数一致，因此起点取计算机的纪元时间，即 0 时刻。
/// 在终端，需要完成值的截取，只取时刻值，不取日期值
DateTime _handleTime(ng.Time v, ValueMetaData meta, int? timezoneOffset) {
  return DateTime(1970, 1, 1, v.hour, v.minute, v.sec + (timezoneOffset ?? 0),
      0, v.microsec);
}

DateTime _handleDate(ng.Date v, ValueMetaData meta, int? timezoneOffset) {
  // ? 当前时间 UTC+8 2024-06-05 21:37，
  // ? 数据库时区为 UTC+12，
  // ? 系统时间为：2024-06-06 01:37，
  // ? 调用 date() 结果值为 2024-06-05
  // ? 确认是否是一个来自数据库的误差
  // var tzTime = DateTime(v.year, v.month, v.day, 12, 0, (timezoneOffset ?? 0));
  // return DateTime(tzTime.year, tzTime.month, tzTime.day);
  return DateTime(v.year, v.month, v.day);
}

Duration _handleDuration(
    ng.Duration v, ValueMetaData meta, int? timezoneOffset) {
  v.isSetMicroseconds();
  v.isSetSeconds();
  v.isSetMonths();

  return Duration(
    seconds: v.seconds,
    microseconds: v.microseconds,
  );
}

_handleGeo(ng.Geography v, ValueMetaData meta) {
  if (v.isSetLsVal()) {
    return v.lsVal;
  }
  if (v.isSetPtVal()) {
    return v.ptVal;
  }
  if (v.isSetPgVal()) {
    return v.pgVal;
  }
  return v;
}

_handlePoint(ng.Point v, ValueMetaData meta) {
  return <dynamic>[v.coord?.x, v.coord?.y, null];
}

_handleLine(ng.LineString v, ValueMetaData meta) {
  return <List<dynamic>>[
    v.coordList?.map((e) => [e.x, e.y, null]).toList() ?? []
  ];
}

_handlePolygon(ng.Polygon v, ValueMetaData meta) {
  return <List<List<dynamic>>>[
    v.coordListList
            ?.map((e) => e.map((e) => [e.x, e.y, null]).toList())
            .toList() ??
        []
  ];
}

// NameGetter _idxName = (p1, dynamic v) => '$p1';
NameGetter _itemName = (p1, dynamic v) => 'item';

_handleSet(ng.NSet v, ValueMetaData meta, int? timezoneOffset,
    [NameGetter? nget]) {
  return _handleList(v.values?.toList() ?? [], meta, timezoneOffset, nget);
}

_handleList(List<dynamic> values, ValueMetaData meta, int? timezoneOffset,
    [NameGetter? nget]) {
  nget ??= _itemName;
  var list = <dynamic>[];
  ValueMetaData valueMeta = meta.submetas.isEmpty
      ? (ValueMetaData()
        ..name = 'item'
        ..type = GdbTypes.unknown)
      : meta.submetas.first;
  for (var v in values) {
    var val = _handleValue(v, valueMeta, timezoneOffset, parent: meta);
    list.add(val);
  }
  return list;
}

List<dynamic> _handleMap(ng.NMap v, ValueMetaData meta, int? timezoneOffset) {
  var kvs = <dynamic>[];
  for (var entry in (v.kvs?.entries ?? <MapEntry<Int8List, ng.Value>>[])) {
    ValueMetaData keyMeta = ValueMetaData()
      ..name = entry.key.utf8String()
      ..type = GdbTypes.unknown;
    _handleValue(entry.value, keyMeta, timezoneOffset,
        parent: meta, parentVal: kvs);
  }
  return kvs;
}
