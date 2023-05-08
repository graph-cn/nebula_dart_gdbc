/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.update_sessions_req;

import 'dart:typed_data' show Uint8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class UpdateSessionsReq implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("UpdateSessionsReq");
  static final TField _SESSIONS_FIELD_DESC =
      new TField("sessions", TType.LIST, 1);

  List<Session>? _sessions;
  static const int SESSIONS = 1;

  UpdateSessionsReq() {}

  // sessions
  List<Session>? get sessions => this._sessions;

  set sessions(List<Session>? sessions) {
    this._sessions = sessions;
  }

  bool isSetSessions() => this.sessions != null;

  unsetSessions() {
    this.sessions = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case SESSIONS:
        return this.sessions;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case SESSIONS:
        if (value == null) {
          unsetSessions();
        } else {
          this.sessions = value as List<Session>;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case SESSIONS:
        return isSetSessions();
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
        case SESSIONS:
          if (field.type == TType.LIST) {
            {
              TList _list350 = iprot.readListBegin();
              this.sessions = <Session>[];
              for (int _i351 = 0; _i351 < _list350.length; ++_i351) {
                Session _elem352;
                _elem352 = new Session();
                _elem352.read(iprot);
                this.sessions?.add(_elem352);
              }
              iprot.readListEnd();
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
    if (this.sessions != null) {
      oprot.writeFieldBegin(_SESSIONS_FIELD_DESC);
      {
        oprot.writeListBegin(new TList(TType.STRUCT, this.sessions?.length));
        for (var elem353 in this.sessions ?? <Session>[]) {
          elem353.write(oprot);
        }
        oprot.writeListEnd();
      }
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("UpdateSessionsReq(");

    ret.write("sessions:");
    if (this.sessions == null) {
      ret.write("null");
    } else {
      ret.write(this.sessions);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
