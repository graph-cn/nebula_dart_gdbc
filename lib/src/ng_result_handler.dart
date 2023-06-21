// Copyright (c) 2023- All nebula_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of nebula_dart_gdbc;

NgResultSet handleResult(ng.ExecutionResponse rs, int? timezoneOffset) {
  ValueMetaData? meta = ValueMetaData();
  var rows = _handleValue(rs.data, meta, timezoneOffset);
  NgResultSet result = NgResultSet()
    ..success = rs.error_code == ng.ErrorCode.SUCCEEDED
    ..rows = rows ?? []
    ..metas = meta.submetas;
  return result;
}

Map<GdbTypes, bool Function(dynamic)> typeGetter = {
  GdbTypes.none: (v) => (v is ng.Value && v.nVal == 0) || v == null,
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
  GdbTypes.none: (v, m, t, nget) => null,
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
  GdbTypes.unknown: (v, m, t, nget) => v,
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

_handlePath(ng.Path path, ValueMetaData meta, int? timezoneOffset) {
  var pathData = <dynamic>[];

  ValueMetaData startNode = ValueMetaData()..name = MetaKey.startNode;
  _handleValue(path.src!, startNode, timezoneOffset,
      parent: meta, parentVal: pathData);

  ValueMetaData steps = ValueMetaData();
  _handleValue(
    path.steps,
    steps,
    timezoneOffset,
    parent: meta,
    parentVal: pathData,
    nameGetter: (idx, step) => ((step as ng.Step).name?.utf8String()),
  );
  return pathData;
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
    v.hour + (timezoneOffset ?? 0),
    v.minute,
    v.sec,
    v.microsec,
  );
}

DateTime _handleTime(ng.Time v, ValueMetaData meta, int? timezoneOffset) {
  return DateTime(v.hour, v.minute, v.sec, v.microsec);
}

DateTime _handleDate(ng.Date v, ValueMetaData meta, int? timezoneOffset) {
  return DateTime(v.year, v.month, v.day, (timezoneOffset ?? 0));
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
