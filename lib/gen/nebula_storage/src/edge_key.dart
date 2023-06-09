// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_storage.src.edge_key;

import 'dart:typed_data' show Uint8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_storage/nebula_storage.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart'
    as t_nebula_meta;

class EdgeKey implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("EdgeKey");
  static final TField _SRC_FIELD_DESC = new TField("src", TType.STRUCT, 1);
  static final TField _EDGE_TYPE_FIELD_DESC =
      new TField("edge_type", TType.I32, 2);
  static final TField _RANKING_FIELD_DESC = new TField("ranking", TType.I64, 3);
  static final TField _DST_FIELD_DESC = new TField("dst", TType.STRUCT, 4);

  t_nebula.Value? _src;
  static const int SRC = 1;
  int _edge_type = 0;
  static const int EDGE_TYPE = 2;
  int _ranking = 0;
  static const int RANKING = 3;
  t_nebula.Value? _dst;
  static const int DST = 4;

  bool __isset_edge_type = false;
  bool __isset_ranking = false;

  EdgeKey() {}

  // src
  t_nebula.Value? get src => this._src;

  set src(t_nebula.Value? src) {
    this._src = src;
  }

  bool isSetSrc() => this.src != null;

  unsetSrc() {
    this.src = null;
  }

  // edge_type
  int get edge_type => this._edge_type;

  set edge_type(int edge_type) {
    this._edge_type = edge_type;
    this.__isset_edge_type = true;
  }

  bool isSetEdge_type() => this.__isset_edge_type;

  unsetEdge_type() {
    this.__isset_edge_type = false;
  }

  // ranking
  int get ranking => this._ranking;

  set ranking(int ranking) {
    this._ranking = ranking;
    this.__isset_ranking = true;
  }

  bool isSetRanking() => this.__isset_ranking;

  unsetRanking() {
    this.__isset_ranking = false;
  }

  // dst
  t_nebula.Value? get dst => this._dst;

  set dst(t_nebula.Value? dst) {
    this._dst = dst;
  }

  bool isSetDst() => this.dst != null;

  unsetDst() {
    this.dst = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case SRC:
        return this.src;
      case EDGE_TYPE:
        return this.edge_type;
      case RANKING:
        return this.ranking;
      case DST:
        return this.dst;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case SRC:
        if (value == null) {
          unsetSrc();
        } else {
          this.src = value as t_nebula.Value;
        }
        break;

      case EDGE_TYPE:
        if (value == null) {
          unsetEdge_type();
        } else {
          this.edge_type = value as int;
        }
        break;

      case RANKING:
        if (value == null) {
          unsetRanking();
        } else {
          this.ranking = value as int;
        }
        break;

      case DST:
        if (value == null) {
          unsetDst();
        } else {
          this.dst = value as t_nebula.Value;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case SRC:
        return isSetSrc();
      case EDGE_TYPE:
        return isSetEdge_type();
      case RANKING:
        return isSetRanking();
      case DST:
        return isSetDst();
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
        case SRC:
          if (field.type == TType.STRUCT) {
            this.src = new t_nebula.Value();
            this.src?.read(iprot);
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case EDGE_TYPE:
          if (field.type == TType.I32) {
            this.edge_type = iprot.readI32();
            this.__isset_edge_type = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case RANKING:
          if (field.type == TType.I64) {
            this.ranking = iprot.readI64();
            this.__isset_ranking = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case DST:
          if (field.type == TType.STRUCT) {
            this.dst = new t_nebula.Value();
            this.dst?.read(iprot);
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
    if (this.src != null) {
      oprot.writeFieldBegin(_SRC_FIELD_DESC);
      this.src?.write(oprot);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldBegin(_EDGE_TYPE_FIELD_DESC);
    oprot.writeI32(this.edge_type);
    oprot.writeFieldEnd();
    oprot.writeFieldBegin(_RANKING_FIELD_DESC);
    oprot.writeI64(this.ranking);
    oprot.writeFieldEnd();
    if (this.dst != null) {
      oprot.writeFieldBegin(_DST_FIELD_DESC);
      this.dst?.write(oprot);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("EdgeKey(");

    ret.write("src:");
    if (this.src == null) {
      ret.write("null");
    } else {
      ret.write(this.src);
    }

    ret.write(", ");
    ret.write("edge_type:");
    ret.write(this.edge_type);

    ret.write(", ");
    ret.write("ranking:");
    ret.write(this.ranking);

    ret.write(", ");
    ret.write("dst:");
    if (this.dst == null) {
      ret.write("null");
    } else {
      ret.write(this.dst);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
