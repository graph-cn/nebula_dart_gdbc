/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.balance_task;

import 'dart:typed_data' show Int8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class BalanceTask implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("BalanceTask");
  static final TField _ID_FIELD_DESC = new TField("id", TType.STRING, 1);
  static final TField _COMMAND_FIELD_DESC =
      new TField("command", TType.STRING, 2);
  static final TField _RESULT_FIELD_DESC = new TField("result", TType.I32, 3);
  static final TField _START_TIME_FIELD_DESC =
      new TField("start_time", TType.I64, 4);
  static final TField _STOP_TIME_FIELD_DESC =
      new TField("stop_time", TType.I64, 5);

  Int8List? _id;
  static const int ID = 1;
  Int8List? _command;
  static const int COMMAND = 2;
  int? _result;
  static const int RESULT = 3;
  int _start_time = 0;
  static const int START_TIME = 4;
  int _stop_time = 0;
  static const int STOP_TIME = 5;

  bool __isset_result = false;
  bool __isset_start_time = false;
  bool __isset_stop_time = false;

  BalanceTask() {}

  // id
  Int8List? get id => this._id;

  set id(Int8List? id) {
    this._id = id;
  }

  bool isSetId() => this.id != null;

  unsetId() {
    this.id = null;
  }

  // command
  Int8List? get command => this._command;

  set command(Int8List? command) {
    this._command = command;
  }

  bool isSetCommand() => this.command != null;

  unsetCommand() {
    this.command = null;
  }

  // result
  int? get result => this._result;

  set result(int? result) {
    this._result = result;
    this.__isset_result = true;
  }

  bool isSetResult() => this.__isset_result;

  unsetResult() {
    this.__isset_result = false;
  }

  // start_time
  int get start_time => this._start_time;

  set start_time(int start_time) {
    this._start_time = start_time;
    this.__isset_start_time = true;
  }

  bool isSetStart_time() => this.__isset_start_time;

  unsetStart_time() {
    this.__isset_start_time = false;
  }

  // stop_time
  int get stop_time => this._stop_time;

  set stop_time(int stop_time) {
    this._stop_time = stop_time;
    this.__isset_stop_time = true;
  }

  bool isSetStop_time() => this.__isset_stop_time;

  unsetStop_time() {
    this.__isset_stop_time = false;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case ID:
        return this.id;
      case COMMAND:
        return this.command;
      case RESULT:
        return this.result;
      case START_TIME:
        return this.start_time;
      case STOP_TIME:
        return this.stop_time;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case ID:
        if (value == null) {
          unsetId();
        } else {
          this.id = value as Int8List?;
        }
        break;

      case COMMAND:
        if (value == null) {
          unsetCommand();
        } else {
          this.command = value as Int8List?;
        }
        break;

      case RESULT:
        if (value == null) {
          unsetResult();
        } else {
          this.result = value as int?;
        }
        break;

      case START_TIME:
        if (value == null) {
          unsetStart_time();
        } else {
          this.start_time = value as int;
        }
        break;

      case STOP_TIME:
        if (value == null) {
          unsetStop_time();
        } else {
          this.stop_time = value as int;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case ID:
        return isSetId();
      case COMMAND:
        return isSetCommand();
      case RESULT:
        return isSetResult();
      case START_TIME:
        return isSetStart_time();
      case STOP_TIME:
        return isSetStop_time();
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
        case ID:
          if (field.type == TType.STRING) {
            this.id = iprot.readBinary();
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case COMMAND:
          if (field.type == TType.STRING) {
            this.command = iprot.readBinary();
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case RESULT:
          if (field.type == TType.I32) {
            this.result = iprot.readI32();
            this.__isset_result = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case START_TIME:
          if (field.type == TType.I64) {
            this.start_time = iprot.readI64();
            this.__isset_start_time = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case STOP_TIME:
          if (field.type == TType.I64) {
            this.stop_time = iprot.readI64();
            this.__isset_stop_time = true;
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
    if (this.id != null) {
      oprot.writeFieldBegin(_ID_FIELD_DESC);
      oprot.writeBinary(this.id);
      oprot.writeFieldEnd();
    }
    if (this.command != null) {
      oprot.writeFieldBegin(_COMMAND_FIELD_DESC);
      oprot.writeBinary(this.command);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldBegin(_RESULT_FIELD_DESC);
    oprot.writeI32(this.result);
    oprot.writeFieldEnd();
    oprot.writeFieldBegin(_START_TIME_FIELD_DESC);
    oprot.writeI64(this.start_time);
    oprot.writeFieldEnd();
    oprot.writeFieldBegin(_STOP_TIME_FIELD_DESC);
    oprot.writeI64(this.stop_time);
    oprot.writeFieldEnd();
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("BalanceTask(");

    ret.write("id:");
    if (this.id == null) {
      ret.write("null");
    } else {
      ret.write("BINARY");
    }

    ret.write(", ");
    ret.write("command:");
    if (this.command == null) {
      ret.write("null");
    } else {
      ret.write("BINARY");
    }

    ret.write(", ");
    ret.write("result:");
    String? result_name = TaskResult.VALUES_TO_NAMES[this.result];
    if (result_name != null) {
      ret.write(result_name);
      ret.write(" (");
    }
    ret.write(this.result);
    if (result_name != null) {
      ret.write(")");
    }

    ret.write(", ");
    ret.write("start_time:");
    ret.write(this.start_time);

    ret.write(", ");
    ret.write("stop_time:");
    ret.write(this.stop_time);

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
    if (isSetResult() && !TaskResult.VALID_VALUES.contains(result)) {
      throw new TProtocolError(TProtocolErrorType.UNKNOWN,
          "The field 'result' has been assigned the invalid value $result");
    }
  }
}
