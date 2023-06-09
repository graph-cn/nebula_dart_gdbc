// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.list_cluster_info_resp;

import 'dart:typed_data' show Uint8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class ListClusterInfoResp implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("ListClusterInfoResp");
  static final TField _CODE_FIELD_DESC = new TField("code", TType.I32, 1);
  static final TField _LEADER_FIELD_DESC =
      new TField("leader", TType.STRUCT, 2);
  static final TField _HOST_SERVICES_FIELD_DESC =
      new TField("host_services", TType.MAP, 3);

  int? _code;
  static const int CODE = 1;
  t_nebula.HostAddr? _leader;
  static const int LEADER = 2;
  Map<String, List<ServiceInfo>>? _host_services;
  static const int HOST_SERVICES = 3;

  bool __isset_code = false;

  ListClusterInfoResp() {}

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

  // host_services
  Map<String, List<ServiceInfo>>? get host_services => this._host_services;

  set host_services(Map<String, List<ServiceInfo>>? host_services) {
    this._host_services = host_services;
  }

  bool isSetHost_services() => this.host_services != null;

  unsetHost_services() {
    this.host_services = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case CODE:
        return this.code;
      case LEADER:
        return this.leader;
      case HOST_SERVICES:
        return this.host_services;
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

      case HOST_SERVICES:
        if (value == null) {
          unsetHost_services();
        } else {
          this.host_services = value as Map<String, List<ServiceInfo>>?;
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
      case HOST_SERVICES:
        return isSetHost_services();
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
        case HOST_SERVICES:
          if (field.type == TType.MAP) {
            {
              TMap _map392 = iprot.readMapBegin();
              this.host_services = new Map<String, List<ServiceInfo>>();
              for (int _i393 = 0; _i393 < _map392.length; ++_i393) {
                String _key394;
                List<ServiceInfo> _val395;
                _key394 = iprot.readString();
                {
                  TList _list396 = iprot.readListBegin();
                  _val395 = <ServiceInfo>[];
                  for (int _i397 = 0; _i397 < _list396.length; ++_i397) {
                    ServiceInfo _elem398;
                    _elem398 = new ServiceInfo();
                    _elem398.read(iprot);
                    _val395.add(_elem398);
                  }
                  iprot.readListEnd();
                }
                this.host_services?[_key394] = _val395;
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
    oprot.writeFieldBegin(_CODE_FIELD_DESC);
    oprot.writeI32(this.code);
    oprot.writeFieldEnd();
    if (this.leader != null) {
      oprot.writeFieldBegin(_LEADER_FIELD_DESC);
      this.leader?.write(oprot);
      oprot.writeFieldEnd();
    }
    if (this.host_services != null) {
      oprot.writeFieldBegin(_HOST_SERVICES_FIELD_DESC);
      {
        oprot.writeMapBegin(
            new TMap(TType.STRING, TType.LIST, this.host_services?.length));
        for (var elem400 in this.host_services?.keys ?? <String>[]) {
          oprot.writeString(elem400);
          {
            oprot.writeListBegin(
                new TList(TType.STRUCT, this.host_services?[elem400]?.length));
            for (var elem401
                in this.host_services?[elem400] ?? <ServiceInfo>[]) {
              elem401.write(oprot);
            }
            oprot.writeListEnd();
          }
        }
        oprot.writeMapEnd();
      }
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("ListClusterInfoResp(");

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

    ret.write(", ");
    ret.write("host_services:");
    if (this.host_services == null) {
      ret.write("null");
    } else {
      ret.write(this.host_services);
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
