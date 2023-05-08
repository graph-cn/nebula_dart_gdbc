// ignore_for_file: unnecessary_this, unnecessary_new, non_constant_identifier_names, annotate_overrides, no_leading_underscores_for_local_identifiers, constant_identifier_names, unused_import, import_of_legacy_library_into_null_safe, slash_for_doc_comments, empty_constructor_bodies

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_storage.src.order_by;

import 'dart:typed_data' show Int8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_storage/nebula_storage.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart'
    as t_nebula_meta;

class OrderBy implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("OrderBy");
  static final TField _PROP_FIELD_DESC = new TField("prop", TType.STRING, 1);
  static final TField _DIRECTION_FIELD_DESC =
      new TField("direction", TType.I32, 2);

  Int8List? _prop;
  static const int PROP = 1;
  int? _direction;
  static const int DIRECTION = 2;

  bool __isset_direction = false;

  OrderBy() {}

  // prop
  Int8List? get prop => this._prop;

  set prop(Int8List? prop) {
    this._prop = prop;
  }

  bool isSetProp() => this.prop != null;

  unsetProp() {
    this.prop = null;
  }

  // direction
  int? get direction => this._direction;

  set direction(int? direction) {
    this._direction = direction;
    this.__isset_direction = true;
  }

  bool isSetDirection() => this.__isset_direction;

  unsetDirection() {
    this.__isset_direction = false;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case PROP:
        return this.prop;
      case DIRECTION:
        return this.direction;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case PROP:
        if (value == null) {
          unsetProp();
        } else {
          this.prop = value as Int8List;
        }
        break;

      case DIRECTION:
        if (value == null) {
          unsetDirection();
        } else {
          this.direction = value as int;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case PROP:
        return isSetProp();
      case DIRECTION:
        return isSetDirection();
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
        case PROP:
          if (field.type == TType.STRING) {
            this.prop = iprot.readBinary();
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case DIRECTION:
          if (field.type == TType.I32) {
            this.direction = iprot.readI32();
            this.__isset_direction = true;
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
    if (this.prop != null) {
      oprot.writeFieldBegin(_PROP_FIELD_DESC);
      oprot.writeBinary(this.prop);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldBegin(_DIRECTION_FIELD_DESC);
    oprot.writeI32(this.direction);
    oprot.writeFieldEnd();
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("OrderBy(");

    ret.write("prop:");
    if (this.prop == null) {
      ret.write("null");
    } else {
      ret.write("BINARY");
    }

    ret.write(", ");
    ret.write("direction:");
    String? direction_name = OrderDirection.VALUES_TO_NAMES[this.direction];
    if (direction_name != null) {
      ret.write(direction_name);
      ret.write(" (");
    }
    ret.write(this.direction);
    if (direction_name != null) {
      ret.write(")");
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
    if (isSetDirection() && !OrderDirection.VALID_VALUES.contains(direction)) {
      throw new TProtocolError(TProtocolErrorType.UNKNOWN,
          "The field 'direction' has been assigned the invalid value $direction");
    }
  }
}
