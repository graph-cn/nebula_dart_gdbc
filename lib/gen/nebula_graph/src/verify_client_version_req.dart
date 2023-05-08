/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_graph.src.verify_client_version_req;

import 'dart:convert';
import 'dart:typed_data' show Int8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_graph/nebula_graph.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class VerifyClientVersionReq implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("VerifyClientVersionReq");
  static final TField _VERSION_FIELD_DESC =
      new TField("version", TType.STRING, 1);

  Int8List? _version;
  static const int VERSION = 1;

  VerifyClientVersionReq() {
    this.version = Int8List.fromList(utf8.encode('3.0.0'));
  }

  // version
  Int8List? get version => this._version;

  set version(Int8List? version) {
    this._version = version;
  }

  bool isSetVersion() => this.version != null;

  unsetVersion() {
    this.version = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case VERSION:
        return this.version;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object value) {
    switch (fieldID) {
      case VERSION:
        if (value == null) {
          unsetVersion();
        } else {
          this.version = value as Int8List;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case VERSION:
        return isSetVersion();
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
        case VERSION:
          if (field.type == TType.STRING) {
            this.version = iprot.readBinary();
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
    if (this.version != null) {
      oprot.writeFieldBegin(_VERSION_FIELD_DESC);
      oprot.writeBinary(this.version);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("VerifyClientVersionReq(");

    ret.write("version:");
    if (this.version == null) {
      ret.write("null");
    } else {
      ret.write("BINARY");
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    if (version == null) {
      throw new TProtocolError(TProtocolErrorType.UNKNOWN,
          "Required field 'version' was not present! Struct: " + toString());
    }
    // check that fields of type enum have valid values
  }
}
