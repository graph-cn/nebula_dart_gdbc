/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.list_service_clients_resp;

import 'dart:typed_data' show Uint8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class ListServiceClientsResp implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("ListServiceClientsResp");
  static final TField _CODE_FIELD_DESC = new TField("code", TType.I32, 1);
  static final TField _LEADER_FIELD_DESC =
      new TField("leader", TType.STRUCT, 2);
  static final TField _CLIENTS_FIELD_DESC = new TField("clients", TType.MAP, 3);

  int? _code;
  static const int CODE = 1;
  t_nebula.HostAddr? _leader;
  static const int LEADER = 2;
  Map<int, List<ServiceClient>>? _clients;
  static const int CLIENTS = 3;

  bool __isset_code = false;

  ListServiceClientsResp() {}

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

  // clients
  Map<int, List<ServiceClient>>? get clients => this._clients;

  set clients(Map<int, List<ServiceClient>>? clients) {
    this._clients = clients;
  }

  bool isSetClients() => this.clients != null;

  unsetClients() {
    this.clients = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case CODE:
        return this.code;
      case LEADER:
        return this.leader;
      case CLIENTS:
        return this.clients;
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

      case CLIENTS:
        if (value == null) {
          unsetClients();
        } else {
          this.clients = value as Map<int, List<ServiceClient>>?;
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
      case CLIENTS:
        return isSetClients();
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
        case CLIENTS:
          if (field.type == TType.MAP) {
            {
              TMap _map318 = iprot.readMapBegin();
              this.clients = new Map<int, List<ServiceClient>>();
              for (int _i319 = 0; _i319 < _map318.length; ++_i319) {
                int _key320;
                List<ServiceClient> _val321;
                _key320 = iprot.readI32();
                {
                  TList _list322 = iprot.readListBegin();
                  _val321 = <ServiceClient>[];
                  for (int _i323 = 0; _i323 < _list322.length; ++_i323) {
                    ServiceClient _elem324;
                    _elem324 = new ServiceClient();
                    _elem324.read(iprot);
                    _val321.add(_elem324);
                  }
                  iprot.readListEnd();
                }
                this.clients?[_key320] = _val321;
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
    if (this.clients != null) {
      oprot.writeFieldBegin(_CLIENTS_FIELD_DESC);
      {
        oprot.writeMapBegin(
            new TMap(TType.I32, TType.LIST, this.clients?.length));
        for (var elem326 in this.clients?.keys ?? <int>[]) {
          oprot.writeI32(elem326);
          {
            oprot.writeListBegin(
                new TList(TType.STRUCT, this.clients?[elem326]?.length));
            for (var elem327 in this.clients?[elem326] ?? <ServiceClient>[]) {
              elem327.write(oprot);
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
    StringBuffer ret = new StringBuffer("ListServiceClientsResp(");

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
    ret.write("clients:");
    if (this.clients == null) {
      ret.write("null");
    } else {
      ret.write(this.clients);
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