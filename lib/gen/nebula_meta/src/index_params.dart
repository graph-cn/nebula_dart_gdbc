/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.index_params;

import 'dart:typed_data' show Uint8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class IndexParams implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("IndexParams");
  static final TField _S2_MAX_LEVEL_FIELD_DESC =
      new TField("s2_max_level", TType.I32, 1);
  static final TField _S2_MAX_CELLS_FIELD_DESC =
      new TField("s2_max_cells", TType.I32, 2);

  int? _s2_max_level;
  static const int S2_MAX_LEVEL = 1;
  int? _s2_max_cells;
  static const int S2_MAX_CELLS = 2;

  bool __isset_s2_max_level = false;
  bool __isset_s2_max_cells = false;

  IndexParams() {}

  // s2_max_level
  int? get s2_max_level => this._s2_max_level;

  set s2_max_level(int? s2_max_level) {
    this._s2_max_level = s2_max_level;
    this.__isset_s2_max_level = true;
  }

  bool isSetS2_max_level() => this.__isset_s2_max_level;

  unsetS2_max_level() {
    this.__isset_s2_max_level = false;
  }

  // s2_max_cells
  int? get s2_max_cells => this._s2_max_cells;

  set s2_max_cells(int? s2_max_cells) {
    this._s2_max_cells = s2_max_cells;
    this.__isset_s2_max_cells = true;
  }

  bool isSetS2_max_cells() => this.__isset_s2_max_cells;

  unsetS2_max_cells() {
    this.__isset_s2_max_cells = false;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case S2_MAX_LEVEL:
        return this.s2_max_level;
      case S2_MAX_CELLS:
        return this.s2_max_cells;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case S2_MAX_LEVEL:
        if (value == null) {
          unsetS2_max_level();
        } else {
          this.s2_max_level = value as int?;
        }
        break;

      case S2_MAX_CELLS:
        if (value == null) {
          unsetS2_max_cells();
        } else {
          this.s2_max_cells = value as int?;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case S2_MAX_LEVEL:
        return isSetS2_max_level();
      case S2_MAX_CELLS:
        return isSetS2_max_cells();
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
        case S2_MAX_LEVEL:
          if (field.type == TType.I32) {
            this.s2_max_level = iprot.readI32();
            this.__isset_s2_max_level = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case S2_MAX_CELLS:
          if (field.type == TType.I32) {
            this.s2_max_cells = iprot.readI32();
            this.__isset_s2_max_cells = true;
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
    if (isSetS2_max_level()) {
      oprot.writeFieldBegin(_S2_MAX_LEVEL_FIELD_DESC);
      oprot.writeI32(this.s2_max_level);
      oprot.writeFieldEnd();
    }
    if (isSetS2_max_cells()) {
      oprot.writeFieldBegin(_S2_MAX_CELLS_FIELD_DESC);
      oprot.writeI32(this.s2_max_cells);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("IndexParams(");

    if (isSetS2_max_level()) {
      ret.write("s2_max_level:");
      ret.write(this.s2_max_level);
    }

    if (isSetS2_max_cells()) {
      ret.write(", ");
      ret.write("s2_max_cells:");
      ret.write(this.s2_max_cells);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}