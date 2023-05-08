/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_graph.src.pair;

import 'dart:typed_data' show Int8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_graph/nebula_graph.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class Pair implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("Pair");
  static final TField _KEY_FIELD_DESC = new TField("key", TType.STRING, 1);
  static final TField _VALUE_FIELD_DESC = new TField("value", TType.STRING, 2);

  Int8List? _key;
  static const int KEY = 1;
  Int8List? _value;
  static const int VALUE = 2;

  Pair() {}

  // key
  Int8List? get key => this._key;

  set key(Int8List? key) {
    this._key = key;
  }

  bool isSetKey() => this.key != null;

  unsetKey() {
    this.key = null;
  }

  // value
  Int8List? get value => this._value;

  set value(Int8List? value) {
    this._value = value;
  }

  bool isSetValue() => this.value != null;

  unsetValue() {
    this.value = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case KEY:
        return this.key;
      case VALUE:
        return this.value;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object value) {
    switch (fieldID) {
      case KEY:
        if (value == null) {
          unsetKey();
        } else {
          this.key = value as Int8List;
        }
        break;

      case VALUE:
        if (value == null) {
          unsetValue();
        } else {
          this.value = value as Int8List;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case KEY:
        return isSetKey();
      case VALUE:
        return isSetValue();
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
        case KEY:
          if (field.type == TType.STRING) {
            this.key = iprot.readBinary();
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case VALUE:
          if (field.type == TType.STRING) {
            this.value = iprot.readBinary();
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
    if (this.key != null) {
      oprot.writeFieldBegin(_KEY_FIELD_DESC);
      oprot.writeBinary(this.key);
      oprot.writeFieldEnd();
    }
    if (this.value != null) {
      oprot.writeFieldBegin(_VALUE_FIELD_DESC);
      oprot.writeBinary(this.value);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("Pair(");

    ret.write("key:");
    if (this.key == null) {
      ret.write("null");
    } else {
      ret.write("BINARY");
    }

    ret.write(", ");
    ret.write("value:");
    if (this.value == null) {
      ret.write("null");
    } else {
      ret.write("BINARY");
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    if (key == null) {
      throw new TProtocolError(TProtocolErrorType.UNKNOWN,
          "Required field 'key' was not present! Struct: " + toString());
    }
    if (value == null) {
      throw new TProtocolError(TProtocolErrorType.UNKNOWN,
          "Required field 'value' was not present! Struct: " + toString());
    }
    // check that fields of type enum have valid values
  }
}
