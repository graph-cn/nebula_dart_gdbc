/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.save_graph_version_req;

import 'dart:convert';
import 'dart:typed_data' show Int8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class SaveGraphVersionReq implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("SaveGraphVersionReq");
  static final TField _CLIENT_VERSION_FIELD_DESC =
      new TField("client_version", TType.STRING, 1);
  static final TField _HOST_FIELD_DESC = new TField("host", TType.STRUCT, 2);
  static final TField _BUILD_VERSION_FIELD_DESC =
      new TField("build_version", TType.STRING, 3);

  Int8List? _client_version;
  static const int CLIENT_VERSION = 1;
  t_nebula.HostAddr? _host;
  static const int HOST = 2;
  Int8List? _build_version;
  static const int BUILD_VERSION = 3;

  SaveGraphVersionReq() {
    this.client_version = Int8List.fromList(utf8.encode('3.0.0'));
  }

  // client_version
  Int8List? get client_version => this._client_version;

  set client_version(Int8List? client_version) {
    this._client_version = client_version;
  }

  bool isSetClient_version() => this.client_version != null;

  unsetClient_version() {
    this.client_version = null;
  }

  // host
  t_nebula.HostAddr? get host => this._host;

  set host(t_nebula.HostAddr? host) {
    this._host = host;
  }

  bool isSetHost() => this.host != null;

  unsetHost() {
    this.host = null;
  }

  // build_version
  Int8List? get build_version => this._build_version;

  set build_version(Int8List? build_version) {
    this._build_version = build_version;
  }

  bool isSetBuild_version() => this.build_version != null;

  unsetBuild_version() {
    this.build_version = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case CLIENT_VERSION:
        return this.client_version;
      case HOST:
        return this.host;
      case BUILD_VERSION:
        return this.build_version;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case CLIENT_VERSION:
        if (value == null) {
          unsetClient_version();
        } else {
          this.client_version = value as Int8List;
        }
        break;

      case HOST:
        if (value == null) {
          unsetHost();
        } else {
          this.host = value as t_nebula.HostAddr;
        }
        break;

      case BUILD_VERSION:
        if (value == null) {
          unsetBuild_version();
        } else {
          this.build_version = value as Int8List;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case CLIENT_VERSION:
        return isSetClient_version();
      case HOST:
        return isSetHost();
      case BUILD_VERSION:
        return isSetBuild_version();
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
        case CLIENT_VERSION:
          if (field.type == TType.STRING) {
            this.client_version = iprot.readBinary();
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case HOST:
          if (field.type == TType.STRUCT) {
            this.host = new t_nebula.HostAddr();
            this.host?.read(iprot);
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case BUILD_VERSION:
          if (field.type == TType.STRING) {
            this.build_version = iprot.readBinary();
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
    if (this.client_version != null) {
      oprot.writeFieldBegin(_CLIENT_VERSION_FIELD_DESC);
      oprot.writeBinary(this.client_version);
      oprot.writeFieldEnd();
    }
    if (this.host != null) {
      oprot.writeFieldBegin(_HOST_FIELD_DESC);
      this.host?.write(oprot);
      oprot.writeFieldEnd();
    }
    if (this.build_version != null) {
      oprot.writeFieldBegin(_BUILD_VERSION_FIELD_DESC);
      oprot.writeBinary(this.build_version);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("SaveGraphVersionReq(");

    ret.write("client_version:");
    if (this.client_version == null) {
      ret.write("null");
    } else {
      ret.write("BINARY");
    }

    ret.write(", ");
    ret.write("host:");
    if (this.host == null) {
      ret.write("null");
    } else {
      ret.write(this.host);
    }

    ret.write(", ");
    ret.write("build_version:");
    if (this.build_version == null) {
      ret.write("null");
    } else {
      ret.write("BINARY");
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    if (client_version == null) {
      throw new TProtocolError(
          TProtocolErrorType.UNKNOWN,
          "Required field 'client_version' was not present! Struct: " +
              toString());
    }
    // check that fields of type enum have valid values
  }
}
