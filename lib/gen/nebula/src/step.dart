/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula.src.step;

import 'dart:typed_data' show Int8List;
import 'package:fbthrift/fbthrift.dart';
import '../nebula.dart';

class Step implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("Step");
  static final TField _DST_FIELD_DESC = new TField("dst", TType.STRUCT, 1);
  static final TField _TYPE_FIELD_DESC = new TField("type", TType.I32, 2);
  static final TField _NAME_FIELD_DESC = new TField("name", TType.STRING, 3);
  static final TField _RANKING_FIELD_DESC = new TField("ranking", TType.I64, 4);
  static final TField _PROPS_FIELD_DESC = new TField("props", TType.MAP, 5);

  Vertex? _dst;
  static const int DST = 1;
  int _type = 0;
  static const int TYPE = 2;
  Int8List? _name;
  static const int NAME = 3;
  int _ranking = 0;
  static const int RANKING = 4;
  Map<Int8List, Value>? _props;
  static const int PROPS = 5;

  bool __isset_type = false;
  bool __isset_ranking = false;

  Step() {}

  // dst
  Vertex? get dst => this._dst;

  set dst(Vertex? dst) {
    this._dst = dst;
  }

  bool isSetDst() => this.dst != null;

  unsetDst() {
    this.dst = null;
  }

  // type
  int get type => this._type;

  set type(int type) {
    this._type = type;
    this.__isset_type = true;
  }

  bool isSetType() => this.__isset_type;

  unsetType() {
    this.__isset_type = false;
  }

  // name
  Int8List? get name => this._name;

  set name(Int8List? name) {
    this._name = name;
  }

  bool isSetName() => this.name != null;

  unsetName() {
    this.name = null;
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

  // props
  Map<Int8List, Value>? get props => this._props;

  set props(Map<Int8List, Value>? props) {
    this._props = props;
  }

  bool isSetProps() => this.props != null;

  unsetProps() {
    this.props = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case DST:
        return this.dst;
      case TYPE:
        return this.type;
      case NAME:
        return this.name;
      case RANKING:
        return this.ranking;
      case PROPS:
        return this.props;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object value) {
    switch (fieldID) {
      case DST:
        if (value == null) {
          unsetDst();
        } else {
          this.dst = value as Vertex;
        }
        break;

      case TYPE:
        if (value == null) {
          unsetType();
        } else {
          this.type = value as int;
        }
        break;

      case NAME:
        if (value == null) {
          unsetName();
        } else {
          this.name = value as Int8List;
        }
        break;

      case RANKING:
        if (value == null) {
          unsetRanking();
        } else {
          this.ranking = value as int;
        }
        break;

      case PROPS:
        if (value == null) {
          unsetProps();
        } else {
          this.props = value as Map<Int8List, Value>;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case DST:
        return isSetDst();
      case TYPE:
        return isSetType();
      case NAME:
        return isSetName();
      case RANKING:
        return isSetRanking();
      case PROPS:
        return isSetProps();
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
        case DST:
          if (field.type == TType.STRUCT) {
            this.dst = new Vertex();
            this.dst?.read(iprot);
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case TYPE:
          if (field.type == TType.I32) {
            this.type = iprot.readI32();
            this.__isset_type = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case NAME:
          if (field.type == TType.STRING) {
            this.name = iprot.readBinary();
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
        case PROPS:
          if (field.type == TType.MAP) {
            {
              TMap _map54 = iprot.readMapBegin();
              this.props = new Map<Int8List, Value>();
              for (int _i55 = 0; _i55 < _map54.length; ++_i55) {
                Int8List _key56;
                Value _val57;
                _key56 = iprot.readBinary();
                _val57 = new Value();
                _val57.read(iprot);
                this.props?[_key56] = _val57;
              }
              iprot.readMapEnd();
            }
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
    if (this.dst != null) {
      oprot.writeFieldBegin(_DST_FIELD_DESC);
      this.dst?.write(oprot);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldBegin(_TYPE_FIELD_DESC);
    oprot.writeI32(this.type);
    oprot.writeFieldEnd();
    if (this.name != null) {
      oprot.writeFieldBegin(_NAME_FIELD_DESC);
      oprot.writeBinary(this.name);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldBegin(_RANKING_FIELD_DESC);
    oprot.writeI64(this.ranking);
    oprot.writeFieldEnd();
    if (this.props != null) {
      oprot.writeFieldBegin(_PROPS_FIELD_DESC);
      {
        oprot.writeMapBegin(
            new TMap(TType.STRING, TType.STRUCT, this.props?.length));
        for (var elem59 in this.props?.keys ?? <Int8List>[]) {
          oprot.writeBinary(elem59);
          this.props?[elem59]?.write(oprot);
        }
        oprot.writeMapEnd();
      }
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("Step(");

    ret.write("dst:");
    if (this.dst == null) {
      ret.write("null");
    } else {
      ret.write(this.dst);
    }

    ret.write(", ");
    ret.write("type:");
    ret.write(this.type);

    ret.write(", ");
    ret.write("name:");
    if (this.name == null) {
      ret.write("null");
    } else {
      ret.write("BINARY");
    }

    ret.write(", ");
    ret.write("ranking:");
    ret.write(this.ranking);

    ret.write(", ");
    ret.write("props:");
    if (this.props == null) {
      ret.write("null");
    } else {
      ret.write(this.props);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}