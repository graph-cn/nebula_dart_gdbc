// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.host_backup_info;

import 'dart:typed_data' show Uint8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class HostBackupInfo implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("HostBackupInfo");
  static final TField _HOST_FIELD_DESC = new TField("host", TType.STRUCT, 1);
  static final TField _CHECKPOINTS_FIELD_DESC =
      new TField("checkpoints", TType.LIST, 2);

  t_nebula.HostAddr? _host;
  static const int HOST = 1;
  List<t_nebula.CheckpointInfo>? _checkpoints;
  static const int CHECKPOINTS = 2;

  HostBackupInfo() {}

  // host
  t_nebula.HostAddr? get host => this._host;

  set host(t_nebula.HostAddr? host) {
    this._host = host;
  }

  bool isSetHost() => this.host != null;

  unsetHost() {
    this.host = null;
  }

  // checkpoints
  List<t_nebula.CheckpointInfo>? get checkpoints => this._checkpoints;

  set checkpoints(List<t_nebula.CheckpointInfo>? checkpoints) {
    this._checkpoints = checkpoints;
  }

  bool isSetCheckpoints() => this.checkpoints != null;

  unsetCheckpoints() {
    this.checkpoints = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case HOST:
        return this.host;
      case CHECKPOINTS:
        return this.checkpoints;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case HOST:
        if (value == null) {
          unsetHost();
        } else {
          this.host = value as t_nebula.HostAddr?;
        }
        break;

      case CHECKPOINTS:
        if (value == null) {
          unsetCheckpoints();
        } else {
          this.checkpoints = value as List<t_nebula.CheckpointInfo>?;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case HOST:
        return isSetHost();
      case CHECKPOINTS:
        return isSetCheckpoints();
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
        case HOST:
          if (field.type == TType.STRUCT) {
            this.host = new t_nebula.HostAddr();
            this.host?.read(iprot);
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case CHECKPOINTS:
          if (field.type == TType.LIST) {
            {
              TList _list266 = iprot.readListBegin();
              this.checkpoints = <t_nebula.CheckpointInfo>[];
              for (int _i267 = 0; _i267 < _list266.length; ++_i267) {
                t_nebula.CheckpointInfo _elem268;
                _elem268 = new t_nebula.CheckpointInfo();
                _elem268.read(iprot);
                this.checkpoints?.add(_elem268);
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
    if (this.host != null) {
      oprot.writeFieldBegin(_HOST_FIELD_DESC);
      this.host?.write(oprot);
      oprot.writeFieldEnd();
    }
    if (this.checkpoints != null) {
      oprot.writeFieldBegin(_CHECKPOINTS_FIELD_DESC);
      {
        oprot.writeListBegin(new TList(TType.STRUCT, this.checkpoints?.length));
        for (var elem269 in this.checkpoints ?? []) {
          elem269.write(oprot);
        }
        oprot.writeListEnd();
      }
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("HostBackupInfo(");

    ret.write("host:");
    if (this.host == null) {
      ret.write("null");
    } else {
      ret.write(this.host);
    }

    ret.write(", ");
    ret.write("checkpoints:");
    if (this.checkpoints == null) {
      ret.write("null");
    } else {
      ret.write(this.checkpoints);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
