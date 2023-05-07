part of nebula_dart_gdbc;

extension Int8ListToString on Int8List {
  String utf8String() {
    return utf8.decode(Uint8List.fromList(this));
  }
}

NgResultSet _handleResult(ng.ExecutionResponse rs, int? timezoneOffset) {
  NgResultSet result = _handleDataSet(rs.data, null, timezoneOffset);
  result.success = rs.error_code == ng.ErrorCode.SUCCEEDED;
  return result;
}

NgResultSet _handleDataSet(
    ng.DataSet? dataSet, ValueMetaData? meta, int? timezoneOffset) {
  meta?.type = GdbTypes.dataSet;
  NgResultSet result = NgResultSet();
  if (dataSet == null) {
    result.metas = [];
    result.rows = [];
    return result;
  }

  var cols = dataSet.column_names;
  result.metas = cols
          ?.map(
            (e) => ValueMetaData()
              ..name = utf8.decode(e)
              ..type = GdbTypes.unknown,
          )
          .toList() ??
      [];

  result.rows = dataSet.rows
          ?.map((row) => List<dynamic>.filled(cols?.length ?? 0, null))
          .toList() ??
      [];

  for (var r = 0; r < (dataSet.rows?.length ?? 0); r++) {
    for (var c = 0; c < (cols?.length ?? 0); c++) {
      var value = dataSet.rows?[r].values?[c];
      var meta = result.metas[c];
      result.rows[r][c] = _handleValue(value!, meta, timezoneOffset);
    }
  }
  return result;
}

_handle(dynamic v, ValueMetaData meta, int? timezoneOffset) {
  Function? handler;
  handler = v is ng.Value
      ? _handleValue
      : v is ng.DataSet
          ? _handleDataSet
          : v is ng.Step
              ? _handleStep
              : null;
  return handler?.call(v, meta, timezoneOffset) ?? v;
}

_handleStep(ng.Step v, ValueMetaData meta, int? timezoneOffset) {
  var step = <dynamic>[];
  ValueMetaData nodeMeta = ValueMetaData()..type = GdbTypes.node;
  var node =
      v.dst != null ? _handleNode(v.dst!, nodeMeta, timezoneOffset) : null;

  var nodeIdx = meta.addSubmeta(nodeMeta);
  if (step.length <= nodeIdx) {
    step.length = nodeIdx + 1;
    step[nodeIdx] = node;
  }

  ValueMetaData propMeta = ValueMetaData()..type = GdbTypes.prop;
  var props = <dynamic>[];
  _handleProps(v.props, propMeta, props, timezoneOffset);
  step.add(props);
  return node;
}

dynamic _handleValue(ng.Value v, ValueMetaData meta, int? timezoneOffset) {
  if (v.nVal != null) {
    meta.type = GdbTypes.none;
    return null;
  }
  if (v.bVal != null) {
    meta.type = GdbTypes.bool;
    return v.bVal;
  }
  if (v.iVal != null) {
    meta.type = GdbTypes.int;
    return v.iVal;
  }
  if (v.fVal != null) {
    meta.type = GdbTypes.float;
    return v.fVal;
  }
  if (v.sVal != null) {
    meta.type = GdbTypes.string;
    return v.sVal?.utf8String();
  }
  if (v.dVal != null) {
    meta.type = GdbTypes.date;

    return DateTime(
      v.dVal!.year,
      v.dVal!.month,
      v.dVal!.day,
      (timezoneOffset ?? 0),
    );
  }
  if (v.tVal != null) {
    meta.type = GdbTypes.time;
    return DateTime(
      v.tVal!.hour,
      v.tVal!.minute,
      v.tVal!.sec,
      v.tVal!.microsec,
    );
  }
  if (v.dtVal != null) {
    meta.type = GdbTypes.dateTime;
    return DateTime(
      v.dtVal!.year,
      v.dtVal!.month,
      v.dtVal!.day,
      v.dtVal!.hour + (timezoneOffset ?? 0),
      v.dtVal!.minute,
      v.dtVal!.sec,
      v.dtVal!.microsec,
    );
  }
  if (v.vVal != null) {
    return _handleNode(v.vVal!, meta, timezoneOffset);
  }
  if (v.eVal != null) {
    return _handleRelationship(v.eVal!, meta, timezoneOffset);
  }
  if (v.pVal != null) {
    return _handlePath(v.pVal!, meta, timezoneOffset);
  }
  if (v.lVal != null) {
    return _handleList(v.lVal!, meta, timezoneOffset);
  }
  if (v.mVal != null) {
    return _handleMap(v.mVal!, meta, timezoneOffset);
  }
  if (v.uVal != null) {
    return _handleSet(v.uVal!, meta, timezoneOffset);
  }
  if (v.gVal != null) {
    return _handleDataSet(v.gVal, meta, timezoneOffset);
  }
  if (v.ggVal != null) {
    return _handleGeo(v.ggVal!, meta);
  }

  if (v.duVal != null) {
    return _handleDuration(meta, v);
  }
}

Duration _handleDuration(ValueMetaData meta, ng.Value v) {
  meta.type = GdbTypes.duration;
  v.duVal?.isSetMicroseconds();
  v.duVal?.isSetSeconds();
  v.duVal?.isSetMonths();

  return Duration(
    seconds: v.duVal?.seconds ?? 0,
    microseconds: v.duVal?.microseconds ?? 0,
  );
}

_handleGeo(ng.Geography v, ValueMetaData meta) {
  if (v.isSetLsVal()) {
    meta.type = GdbTypes.line;
    return v.lsVal;
  }
  if (v.isSetPtVal()) {
    meta.type = GdbTypes.point;
    return v.ptVal;
  }
  if (v.isSetPgVal()) {
    meta.type = GdbTypes.polygon;
    return v.pgVal;
  }
  meta.type = GdbTypes.unknown;
  return v;
}

_handleSet(ng.NSet v, ValueMetaData meta, int? timezoneOffset) {
  meta.type = GdbTypes.set;
  var values = <dynamic>{};
  _handleCollection(meta, v.values, timezoneOffset, set: values);
  return values;
}

_handleList(ng.NList v, ValueMetaData meta, int? timezoneOffset) {
  meta.type = GdbTypes.list;
  var values = <dynamic>[];
  _handleCollection(meta, v.values, timezoneOffset, list: values);
  return values;
}

const _needTypeDetail = [
  GdbTypes.dataSet,
  GdbTypes.node,
  GdbTypes.relationship,
  GdbTypes.path,
  GdbTypes.step,
];

_handleCollection(
  ValueMetaData meta,
  dynamic values,
  int? timezoneOffset, {
  List<dynamic>? list,
  Set<dynamic>? set,
}) {
  if (values == null) {
    return;
  }
  for (var v in values) {
    ValueMetaData valueMeta = ValueMetaData()
      ..name = ''
      ..type = GdbTypes.unknown;
    var value = _handle(v, valueMeta, timezoneOffset);
    // TODO 补全path属性
    if (_needTypeDetail.contains(valueMeta.type) && list != null) {
      for (var element in valueMeta.submetas) {
        var c = valueMeta.submetas.indexOf(element);
        var valueIdx = meta.addSubmeta(element);
        if (list.length <= valueIdx) {
          list.length = valueIdx + 1;
          list[valueIdx] = value[c];
        }
      }
    } else {
      list?.add(value);
    }
    set?.add(value);
  }
}

List<dynamic> _handleMap(ng.NMap v, ValueMetaData meta, int? timezoneOffset) {
  meta.type = GdbTypes.map;
  var kvs = <dynamic>[];
  _handleProps(v.kvs, meta, kvs, timezoneOffset);
  return kvs;
}

_handlePath(ng.Path v, ValueMetaData meta, int? timezoneOffset) {
  v.src;
  v.steps;
  meta.type = GdbTypes.path;
  var path = <dynamic>[];

  ValueMetaData startNode = ValueMetaData()..name = r'startNode$';
  if (v.src != null) {
    var value = _handleNode(v.src!, startNode, timezoneOffset);
    _extendListBasic(meta, startNode, path, value);
  }

  if (v.steps != null) {
    ValueMetaData stepMeta = ValueMetaData()
      ..name = r'steps$'
      ..type = GdbTypes.list;
    var steps = <dynamic>[];
    _handleCollection(stepMeta, v.steps, timezoneOffset, list: steps);
  }

  return path;
}

List<dynamic> _handleRelationship(
    ng.Edge v, ValueMetaData meta, int? timezoneOffset) {
  meta.type = GdbTypes.relationship;
  var edgeData = [];
  ValueMetaData startNodeId = ValueMetaData()..name = r'startNodeId$';
  _extendList(meta, startNodeId, edgeData, v.src, timezoneOffset);

  ValueMetaData idMeta = ValueMetaData()
    ..name = r'id$'
    ..type = GdbTypes.int;
  _extendListBasic(meta, idMeta, edgeData, v.ranking);

  ValueMetaData endNodeId = ValueMetaData()..name = r'endNodeId$';
  _extendList(meta, endNodeId, edgeData, v.dst, timezoneOffset);

  ValueMetaData edgeMeta = ValueMetaData()
    ..name = utf8.decode(v.name ?? [])
    ..type = GdbTypes.relationship;
  List<dynamic> edgeProp = [];

  _handleProps(v.props, edgeMeta, edgeProp, timezoneOffset);
  return edgeData;
}

List<dynamic> _handleNode(
    ng.Vertex v, ValueMetaData meta, int? timezoneOffset) {
  meta.type = GdbTypes.node;
  ValueMetaData idMeta = ValueMetaData();
  idMeta.name = r'id$';
  var nodeData = [];

  _extendList(meta, idMeta, nodeData, v.vid!, timezoneOffset);

  for (var i = 0; i < (v.tags?.length ?? 0); i++) {
    ValueMetaData tagMeta = ValueMetaData();
    tagMeta.type = GdbTypes.tag;
    tagMeta.name = utf8.decode(v.tags![i].name ?? []);
    meta.addSubmeta(tagMeta);
    _extendListForTag(meta, tagMeta, nodeData, v.tags![i], timezoneOffset);
  }

  return nodeData;
}

void _extendListBasic(
  ValueMetaData meta,
  ValueMetaData submeta,
  List<dynamic> nodeData,
  dynamic value,
) {
  var subIdx = meta.addSubmeta(submeta);
  if (nodeData.length <= subIdx) {
    nodeData.length = subIdx + 1;
  }
  nodeData[subIdx] = value;
}

void _extendList(
  ValueMetaData meta,
  ValueMetaData submeta,
  List<dynamic> nodeData,
  ng.Value? v,
  int? timezoneOffset,
) {
  var subIdx = meta.addSubmeta(submeta);
  if (nodeData.length <= subIdx) {
    nodeData.length = subIdx + 1;
  }

  nodeData[subIdx] =
      v == null ? null : _handleValue(v, submeta, timezoneOffset);
}

void _extendListForTag(
  ValueMetaData meta,
  ValueMetaData submeta,
  List<dynamic> nodeData,
  ng.Tag tag,
  int? timezoneOffset,
) {
  var subIdx = meta.addSubmeta(submeta);
  if (nodeData.length <= subIdx) {
    nodeData.length = subIdx + 1;
  }

  var props = [];
  _handleProps(tag.props, submeta, props, timezoneOffset);

  nodeData[subIdx] = props;
}

void _handleProps(
  Map<Int8List, ng.Value>? propsMap,
  ValueMetaData tableMeta,
  List<dynamic> props,
  int? timezoneOffset,
) {
  for (var entry in (propsMap ?? <Int8List, ng.Value>{}).entries) {
    ValueMetaData propMeta = ValueMetaData();
    propMeta.type = GdbTypes.prop;
    propMeta.name = utf8.decode(entry.key);
    _extendList(tableMeta, propMeta, props, entry.value, timezoneOffset);
  }
}
