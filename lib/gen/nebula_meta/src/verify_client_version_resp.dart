/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.verify_client_version_resp;

import 'dart:typed_data' show Int8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class VerifyClientVersionResp implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("VerifyClientVersionResp");
  static final TField _CODE_FIELD_DESC = new TField("code", TType.I32, 1);
  static final TField _LEADER_FIELD_DESC =
      new TField("leader", TType.STRUCT, 2);
  static final TField _ERROR_MSG_FIELD_DESC =
      new TField("error_msg", TType.STRING, 3);

  int? _code;
  static const int CODE = 1;
  t_nebula.HostAddr? _leader;
  static const int LEADER = 2;
  Int8List? _error_msg;
  static const int ERROR_MSG = 3;

  bool __isset_code = false;

  VerifyClientVersionResp() {}

  // code
  int? get code => this._code;

  set code(int? code) {
    this._code = code;
    this.__isset_code = true;
  }

  bool isSetCode() => this.__isset_code;

  unsetCode() {
    this.__isset_code = false;
  }

  // leader
  t_nebula.HostAddr? get leader => this._leader;

  set leader(t_nebula.HostAddr? leader) {
    this._leader = leader;
  }

  bool isSetLeader() => this.leader != null;

  unsetLeader() {
    this.leader = null;
  }

  // error_msg
  Int8List? get error_msg => this._error_msg;

  set error_msg(Int8List? error_msg) {
    this._error_msg = error_msg;
  }

  bool isSetError_msg() => this.error_msg != null;

  unsetError_msg() {
    this.error_msg = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case CODE:
        return this.code;
      case LEADER:
        return this.leader;
      case ERROR_MSG:
        return this.error_msg;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case CODE:
        if (value == null) {
          unsetCode();
        } else {
          this.code = value as int?;
        }
        break;

      case LEADER:
        if (value == null) {
          unsetLeader();
        } else {
          this.leader = value as t_nebula.HostAddr?;
        }
        break;

      case ERROR_MSG:
        if (value == null) {
          unsetError_msg();
        } else {
          this.error_msg = value as Int8List?;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case CODE:
        return isSetCode();
      case LEADER:
        return isSetLeader();
      case ERROR_MSG:
        return isSetError_msg();
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
        case CODE:
          if (field.type == TType.I32) {
            this.code = iprot.readI32();
            this.__isset_code = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case LEADER:
          if (field.type == TType.STRUCT) {
            this.leader = new t_nebula.HostAddr();
            this.leader?.read(iprot);
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case ERROR_MSG:
          if (field.type == TType.STRING) {
            this.error_msg = iprot.readBinary();
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
    oprot.writeFieldBegin(_CODE_FIELD_DESC);
    oprot.writeI32(this.code);
    oprot.writeFieldEnd();
    if (this.leader != null) {
      oprot.writeFieldBegin(_LEADER_FIELD_DESC);
      this.leader?.write(oprot);
      oprot.writeFieldEnd();
    }
    if (isSetError_msg()) {
      if (this.error_msg != null) {
        oprot.writeFieldBegin(_ERROR_MSG_FIELD_DESC);
        oprot.writeBinary(this.error_msg);
        oprot.writeFieldEnd();
      }
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("VerifyClientVersionResp(");

    ret.write("code:");
    String? code_name = t_nebula.ErrorCode.VALUES_TO_NAMES[this.code];
    if (code_name != null) {
      ret.write(code_name);
      ret.write(" (");
    }
    ret.write(this.code);
    if (code_name != null) {
      ret.write(")");
    }

    ret.write(", ");
    ret.write("leader:");
    if (this.leader == null) {
      ret.write("null");
    } else {
      ret.write(this.leader);
    }

    if (isSetError_msg()) {
      ret.write(", ");
      ret.write("error_msg:");
      if (this.error_msg == null) {
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
    if (isSetCode() && !t_nebula.ErrorCode.VALID_VALUES.contains(code)) {
      throw new TProtocolError(TProtocolErrorType.UNKNOWN,
          "The field 'code' has been assigned the invalid value $code");
    }
  }
}
