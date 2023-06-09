// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_storage.src.traverse_spec;

import 'dart:typed_data' show Int8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_storage/nebula_storage.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart'
    as t_nebula_meta;

class TraverseSpec implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("TraverseSpec");
  static final TField _EDGE_TYPES_FIELD_DESC =
      new TField("edge_types", TType.LIST, 1);
  static final TField _EDGE_DIRECTION_FIELD_DESC =
      new TField("edge_direction", TType.I32, 2);
  static final TField _DEDUP_FIELD_DESC = new TField("dedup", TType.BOOL, 3);
  static final TField _STAT_PROPS_FIELD_DESC =
      new TField("stat_props", TType.LIST, 4);
  static final TField _VERTEX_PROPS_FIELD_DESC =
      new TField("vertex_props", TType.LIST, 5);
  static final TField _EDGE_PROPS_FIELD_DESC =
      new TField("edge_props", TType.LIST, 6);
  static final TField _EXPRESSIONS_FIELD_DESC =
      new TField("expressions", TType.LIST, 7);
  static final TField _ORDER_BY_FIELD_DESC =
      new TField("order_by", TType.LIST, 8);
  static final TField _RANDOM_FIELD_DESC = new TField("random", TType.BOOL, 9);
  static final TField _LIMIT_FIELD_DESC = new TField("limit", TType.I64, 10);
  static final TField _FILTER_FIELD_DESC =
      new TField("filter", TType.STRING, 11);
  static final TField _TAG_FILTER_FIELD_DESC =
      new TField("tag_filter", TType.STRING, 12);

  List<int>? _edge_types;
  static const int EDGE_TYPES = 1;
  int? _edge_direction;
  static const int EDGE_DIRECTION = 2;
  bool _dedup = false;
  static const int DEDUP = 3;
  List<StatProp>? _stat_props;
  static const int STAT_PROPS = 4;
  List<VertexProp>? _vertex_props;
  static const int VERTEX_PROPS = 5;
  List<EdgeProp>? _edge_props;
  static const int EDGE_PROPS = 6;
  List<Expr>? _expressions;
  static const int EXPRESSIONS = 7;
  List<OrderBy>? _order_by;
  static const int ORDER_BY = 8;
  bool? _random;
  static const int RANDOM = 9;
  int? _limit;
  static const int LIMIT = 10;
  Int8List? _filter;
  static const int FILTER = 11;
  Int8List? _tag_filter;
  static const int TAG_FILTER = 12;

  bool __isset_edge_direction = false;
  bool __isset_dedup = false;
  bool __isset_random = false;
  bool __isset_limit = false;

  TraverseSpec() {
    this.edge_direction = 1;

    this.dedup = false;
  }

  // edge_types
  List<int>? get edge_types => this._edge_types;

  set edge_types(List<int>? edge_types) {
    this._edge_types = edge_types;
  }

  bool isSetEdge_types() => this.edge_types != null;

  unsetEdge_types() {
    this.edge_types = null;
  }

  // edge_direction
  int? get edge_direction => this._edge_direction;

  set edge_direction(int? edge_direction) {
    this._edge_direction = edge_direction;
    this.__isset_edge_direction = true;
  }

  bool isSetEdge_direction() => this.__isset_edge_direction;

  unsetEdge_direction() {
    this.__isset_edge_direction = false;
  }

  // dedup
  bool get dedup => this._dedup;

  set dedup(bool dedup) {
    this._dedup = dedup;
    this.__isset_dedup = true;
  }

  bool isSetDedup() => this.__isset_dedup;

  unsetDedup() {
    this.__isset_dedup = false;
  }

  // stat_props
  List<StatProp>? get stat_props => this._stat_props;

  set stat_props(List<StatProp>? stat_props) {
    this._stat_props = stat_props;
  }

  bool isSetStat_props() => this.stat_props != null;

  unsetStat_props() {
    this.stat_props = null;
  }

  // vertex_props
  List<VertexProp>? get vertex_props => this._vertex_props;

  set vertex_props(List<VertexProp>? vertex_props) {
    this._vertex_props = vertex_props;
  }

  bool isSetVertex_props() => this.vertex_props != null;

  unsetVertex_props() {
    this.vertex_props = null;
  }

  // edge_props
  List<EdgeProp>? get edge_props => this._edge_props;

  set edge_props(List<EdgeProp>? edge_props) {
    this._edge_props = edge_props;
  }

  bool isSetEdge_props() => this.edge_props != null;

  unsetEdge_props() {
    this.edge_props = null;
  }

  // expressions
  List<Expr>? get expressions => this._expressions;

  set expressions(List<Expr>? expressions) {
    this._expressions = expressions;
  }

  bool isSetExpressions() => this.expressions != null;

  unsetExpressions() {
    this.expressions = null;
  }

  // order_by
  List<OrderBy>? get order_by => this._order_by;

  set order_by(List<OrderBy>? order_by) {
    this._order_by = order_by;
  }

  bool isSetOrder_by() => this.order_by != null;

  unsetOrder_by() {
    this.order_by = null;
  }

  // random
  bool? get random => this._random;

  set random(bool? random) {
    this._random = random;
    this.__isset_random = true;
  }

  bool isSetRandom() => this.__isset_random;

  unsetRandom() {
    this.__isset_random = false;
  }

  // limit
  int? get limit => this._limit;

  set limit(int? limit) {
    this._limit = limit;
    this.__isset_limit = true;
  }

  bool isSetLimit() => this.__isset_limit;

  unsetLimit() {
    this.__isset_limit = false;
  }

  // filter
  Int8List? get filter => this._filter;

  set filter(Int8List? filter) {
    this._filter = filter;
  }

  bool isSetFilter() => this.filter != null;

  unsetFilter() {
    this.filter = null;
  }

  // tag_filter
  Int8List? get tag_filter => this._tag_filter;

  set tag_filter(Int8List? tag_filter) {
    this._tag_filter = tag_filter;
  }

  bool isSetTag_filter() => this.tag_filter != null;

  unsetTag_filter() {
    this.tag_filter = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case EDGE_TYPES:
        return this.edge_types;
      case EDGE_DIRECTION:
        return this.edge_direction;
      case DEDUP:
        return this.dedup;
      case STAT_PROPS:
        return this.stat_props;
      case VERTEX_PROPS:
        return this.vertex_props;
      case EDGE_PROPS:
        return this.edge_props;
      case EXPRESSIONS:
        return this.expressions;
      case ORDER_BY:
        return this.order_by;
      case RANDOM:
        return this.random;
      case LIMIT:
        return this.limit;
      case FILTER:
        return this.filter;
      case TAG_FILTER:
        return this.tag_filter;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case EDGE_TYPES:
        if (value == null) {
          unsetEdge_types();
        } else {
          this.edge_types = value as List<int>;
        }
        break;

      case EDGE_DIRECTION:
        if (value == null) {
          unsetEdge_direction();
        } else {
          this.edge_direction = value as int;
        }
        break;

      case DEDUP:
        if (value == null) {
          unsetDedup();
        } else {
          this.dedup = value as bool;
        }
        break;

      case STAT_PROPS:
        if (value == null) {
          unsetStat_props();
        } else {
          this.stat_props = value as List<StatProp>;
        }
        break;

      case VERTEX_PROPS:
        if (value == null) {
          unsetVertex_props();
        } else {
          this.vertex_props = value as List<VertexProp>;
        }
        break;

      case EDGE_PROPS:
        if (value == null) {
          unsetEdge_props();
        } else {
          this.edge_props = value as List<EdgeProp>;
        }
        break;

      case EXPRESSIONS:
        if (value == null) {
          unsetExpressions();
        } else {
          this.expressions = value as List<Expr>;
        }
        break;

      case ORDER_BY:
        if (value == null) {
          unsetOrder_by();
        } else {
          this.order_by = value as List<OrderBy>;
        }
        break;

      case RANDOM:
        if (value == null) {
          unsetRandom();
        } else {
          this.random = value as bool;
        }
        break;

      case LIMIT:
        if (value == null) {
          unsetLimit();
        } else {
          this.limit = value as int;
        }
        break;

      case FILTER:
        if (value == null) {
          unsetFilter();
        } else {
          this.filter = value as Int8List;
        }
        break;

      case TAG_FILTER:
        if (value == null) {
          unsetTag_filter();
        } else {
          this.tag_filter = value as Int8List;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case EDGE_TYPES:
        return isSetEdge_types();
      case EDGE_DIRECTION:
        return isSetEdge_direction();
      case DEDUP:
        return isSetDedup();
      case STAT_PROPS:
        return isSetStat_props();
      case VERTEX_PROPS:
        return isSetVertex_props();
      case EDGE_PROPS:
        return isSetEdge_props();
      case EXPRESSIONS:
        return isSetExpressions();
      case ORDER_BY:
        return isSetOrder_by();
      case RANDOM:
        return isSetRandom();
      case LIMIT:
        return isSetLimit();
      case FILTER:
        return isSetFilter();
      case TAG_FILTER:
        return isSetTag_filter();
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  read(TProtocol iprot) {
    TField field;
    iprot.readStructBegin();
    while (true) {
      field = iprot.readFieldBegin();
      if (field.type == TType.STOP) {
        break;
      }
      switch (field.id) {
        case EDGE_TYPES:
          if (field.type == TType.LIST) {
            {
              TList _list18 = iprot.readListBegin();
              this.edge_types = <int>[];
              for (int _i19 = 0; _i19 < _list18.length; ++_i19) {
                int _elem20;
                _elem20 = iprot.readI32();
                this.edge_types?.add(_elem20);
              }
              iprot.readListEnd();
            }
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case EDGE_DIRECTION:
          if (field.type == TType.I32) {
            this.edge_direction = iprot.readI32();
            this.__isset_edge_direction = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case DEDUP:
          if (field.type == TType.BOOL) {
            this.dedup = iprot.readBool();
            this.__isset_dedup = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case STAT_PROPS:
          if (field.type == TType.LIST) {
            {
              TList _list21 = iprot.readListBegin();
              this.stat_props = <StatProp>[];
              for (int _i22 = 0; _i22 < _list21.length; ++_i22) {
                StatProp _elem23;
                _elem23 = new StatProp();
                _elem23.read(iprot);
                this.stat_props?.add(_elem23);
              }
              iprot.readListEnd();
            }
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case VERTEX_PROPS:
          if (field.type == TType.LIST) {
            {
              TList _list24 = iprot.readListBegin();
              this.vertex_props = <VertexProp>[];
              for (int _i25 = 0; _i25 < _list24.length; ++_i25) {
                VertexProp _elem26;
                _elem26 = new VertexProp();
                _elem26.read(iprot);
                this.vertex_props?.add(_elem26);
              }
              iprot.readListEnd();
            }
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case EDGE_PROPS:
          if (field.type == TType.LIST) {
            {
              TList _list27 = iprot.readListBegin();
              this.edge_props = <EdgeProp>[];
              for (int _i28 = 0; _i28 < _list27.length; ++_i28) {
                EdgeProp _elem29;
                _elem29 = new EdgeProp();
                _elem29.read(iprot);
                this.edge_props?.add(_elem29);
              }
              iprot.readListEnd();
            }
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case EXPRESSIONS:
          if (field.type == TType.LIST) {
            {
              TList _list30 = iprot.readListBegin();
              this.expressions = <Expr>[];
              for (int _i31 = 0; _i31 < _list30.length; ++_i31) {
                Expr _elem32;
                _elem32 = new Expr();
                _elem32.read(iprot);
                this.expressions?.add(_elem32);
              }
              iprot.readListEnd();
            }
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case ORDER_BY:
          if (field.type == TType.LIST) {
            {
              TList _list33 = iprot.readListBegin();
              this.order_by = <OrderBy>[];
              for (int _i34 = 0; _i34 < _list33.length; ++_i34) {
                OrderBy _elem35;
                _elem35 = new OrderBy();
                _elem35.read(iprot);
                this.order_by?.add(_elem35);
              }
              iprot.readListEnd();
            }
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case RANDOM:
          if (field.type == TType.BOOL) {
            this.random = iprot.readBool();
            this.__isset_random = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case LIMIT:
          if (field.type == TType.I64) {
            this.limit = iprot.readI64();
            this.__isset_limit = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case FILTER:
          if (field.type == TType.STRING) {
            this.filter = iprot.readBinary();
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case TAG_FILTER:
          if (field.type == TType.STRING) {
            this.tag_filter = iprot.readBinary();
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        default:
          TProtocolUtil.skip(iprot, field.type);
          break;
      }
      iprot.readFieldEnd();
    }
    iprot.readStructEnd();

    // check for required fields of primitive type, which can't be checked in the validate method
    validate();
  }

  write(TProtocol oprot) {
    validate();

    oprot.writeStructBegin(_STRUCT_DESC);
    if (this.edge_types != null) {
      oprot.writeFieldBegin(_EDGE_TYPES_FIELD_DESC);
      {
        oprot.writeListBegin(new TList(TType.I32, this.edge_types?.length));
        for (var elem36 in this.edge_types ?? []) {
          oprot.writeI32(elem36);
        }
        oprot.writeListEnd();
      }
      oprot.writeFieldEnd();
    }
    oprot.writeFieldBegin(_EDGE_DIRECTION_FIELD_DESC);
    oprot.writeI32(this.edge_direction);
    oprot.writeFieldEnd();
    oprot.writeFieldBegin(_DEDUP_FIELD_DESC);
    oprot.writeBool(this.dedup);
    oprot.writeFieldEnd();
    if (isSetStat_props()) {
      if (this.stat_props != null) {
        oprot.writeFieldBegin(_STAT_PROPS_FIELD_DESC);
        {
          oprot
              .writeListBegin(new TList(TType.STRUCT, this.stat_props?.length));
          for (var elem37 in this.stat_props ?? []) {
            elem37.write(oprot);
          }
          oprot.writeListEnd();
        }
        oprot.writeFieldEnd();
      }
    }
    if (isSetVertex_props()) {
      if (this.vertex_props != null) {
        oprot.writeFieldBegin(_VERTEX_PROPS_FIELD_DESC);
        {
          oprot.writeListBegin(
              new TList(TType.STRUCT, this.vertex_props?.length));
          for (var elem38 in this.vertex_props ?? []) {
            elem38.write(oprot);
          }
          oprot.writeListEnd();
        }
        oprot.writeFieldEnd();
      }
    }
    if (isSetEdge_props()) {
      if (this.edge_props != null) {
        oprot.writeFieldBegin(_EDGE_PROPS_FIELD_DESC);
        {
          oprot
              .writeListBegin(new TList(TType.STRUCT, this.edge_props?.length));
          for (var elem39 in this.edge_props ?? []) {
            elem39.write(oprot);
          }
          oprot.writeListEnd();
        }
        oprot.writeFieldEnd();
      }
    }
    if (isSetExpressions()) {
      if (this.expressions != null) {
        oprot.writeFieldBegin(_EXPRESSIONS_FIELD_DESC);
        {
          oprot.writeListBegin(
              new TList(TType.STRUCT, this.expressions?.length));
          for (var elem40 in this.expressions ?? []) {
            elem40.write(oprot);
          }
          oprot.writeListEnd();
        }
        oprot.writeFieldEnd();
      }
    }
    if (isSetOrder_by()) {
      if (this.order_by != null) {
        oprot.writeFieldBegin(_ORDER_BY_FIELD_DESC);
        {
          oprot.writeListBegin(new TList(TType.STRUCT, this.order_by?.length));
          for (var elem41 in this.order_by ?? []) {
            elem41.write(oprot);
          }
          oprot.writeListEnd();
        }
        oprot.writeFieldEnd();
      }
    }
    if (isSetRandom()) {
      oprot.writeFieldBegin(_RANDOM_FIELD_DESC);
      oprot.writeBool(this.random);
      oprot.writeFieldEnd();
    }
    if (isSetLimit()) {
      oprot.writeFieldBegin(_LIMIT_FIELD_DESC);
      oprot.writeI64(this.limit);
      oprot.writeFieldEnd();
    }
    if (isSetFilter()) {
      if (this.filter != null) {
        oprot.writeFieldBegin(_FILTER_FIELD_DESC);
        oprot.writeBinary(this.filter);
        oprot.writeFieldEnd();
      }
    }
    if (isSetTag_filter()) {
      if (this.tag_filter != null) {
        oprot.writeFieldBegin(_TAG_FILTER_FIELD_DESC);
        oprot.writeBinary(this.tag_filter);
        oprot.writeFieldEnd();
      }
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("TraverseSpec(");

    ret.write("edge_types:");
    if (this.edge_types == null) {
      ret.write("null");
    } else {
      ret.write(this.edge_types);
    }

    ret.write(", ");
    ret.write("edge_direction:");
    String? edge_direction_name =
        EdgeDirection.VALUES_TO_NAMES[this.edge_direction];
    if (edge_direction_name != null) {
      ret.write(edge_direction_name);
      ret.write(" (");
    }
    ret.write(this.edge_direction);
    if (edge_direction_name != null) {
      ret.write(")");
    }

    ret.write(", ");
    ret.write("dedup:");
    ret.write(this.dedup);

    if (isSetStat_props()) {
      ret.write(", ");
      ret.write("stat_props:");
      if (this.stat_props == null) {
        ret.write("null");
      } else {
        ret.write(this.stat_props);
      }
    }

    if (isSetVertex_props()) {
      ret.write(", ");
      ret.write("vertex_props:");
      if (this.vertex_props == null) {
        ret.write("null");
      } else {
        ret.write(this.vertex_props);
      }
    }

    if (isSetEdge_props()) {
      ret.write(", ");
      ret.write("edge_props:");
      if (this.edge_props == null) {
        ret.write("null");
      } else {
        ret.write(this.edge_props);
      }
    }

    if (isSetExpressions()) {
      ret.write(", ");
      ret.write("expressions:");
      if (this.expressions == null) {
        ret.write("null");
      } else {
        ret.write(this.expressions);
      }
    }

    if (isSetOrder_by()) {
      ret.write(", ");
      ret.write("order_by:");
      if (this.order_by == null) {
        ret.write("null");
      } else {
        ret.write(this.order_by);
      }
    }

    if (isSetRandom()) {
      ret.write(", ");
      ret.write("random:");
      ret.write(this.random);
    }

    if (isSetLimit()) {
      ret.write(", ");
      ret.write("limit:");
      ret.write(this.limit);
    }

    if (isSetFilter()) {
      ret.write(", ");
      ret.write("filter:");
      if (this.filter == null) {
        ret.write("null");
      } else {
        ret.write("BINARY");
      }
    }

    if (isSetTag_filter()) {
      ret.write(", ");
      ret.write("tag_filter:");
      if (this.tag_filter == null) {
        ret.write("null");
      } else {
        ret.write("BINARY");
      }
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
    if (isSetEdge_direction() &&
        !EdgeDirection.VALID_VALUES.contains(edge_direction)) {
      throw new TProtocolError(TProtocolErrorType.UNKNOWN,
          "The field 'edge_direction' has been assigned the invalid value $edge_direction");
    }
  }
}
