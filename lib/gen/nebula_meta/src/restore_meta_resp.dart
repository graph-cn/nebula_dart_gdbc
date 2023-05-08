/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.restore_meta_resp;

import 'dart:typed_data' show Uint8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class RestoreMetaResp implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("RestoreMetaResp");
  static final TField _CODE_FIELD_DESC = new TField("code", TType.I32, 1);
  static final TField _LEADER_FIELD_DESC =
      new TField("leader", TType.STRUCT, 2);
  static final TField _PART_HOSTS_FIELD_DESC =
      new TField("part_hosts", TType.MAP, 3);

  int? _code;
  static const int CODE = 1;
  t_nebula.HostAddr? _leader;
  static const int LEADER = 2;
  Map<int, List<PartInfo>>? _part_hosts;
  static const int PART_HOSTS = 3;

  bool __isset_code = false;

  RestoreMetaResp() {}

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

  // part_hosts
  Map<int, List<PartInfo>>? get part_hosts => this._part_hosts;

  set part_hosts(Map<int, List<PartInfo>>? part_hosts) {
    this._part_hosts = part_hosts;
  }

  bool isSetPart_hosts() => this.part_hosts != null;

  unsetPart_hosts() {
    this.part_hosts = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case CODE:
        return this.code;
      case LEADER:
        return this.leader;
      case PART_HOSTS:
        return this.part_hosts;
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

      case PART_HOSTS:
        if (value == null) {
          unsetPart_hosts();
        } else {
          this.part_hosts = value as Map<int, List<PartInfo>>?;
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
      case PART_HOSTS:
        return isSetPart_hosts();
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
        case PART_HOSTS:
          if (field.type == TType.MAP) {
            {
              TMap _map304 = iprot.readMapBegin();
              this.part_hosts = new Map<int, List<PartInfo>>();
              for (int _i305 = 0; _i305 < _map304.length; ++_i305) {
                int _key306;
                List<PartInfo> _val307;
                _key306 = iprot.readI32();
                {
                  TList _list308 = iprot.readListBegin();
                  _val307 = <PartInfo>[];
                  for (int _i309 = 0; _i309 < _list308.length; ++_i309) {
                    PartInfo _elem310;
                    _elem310 = new PartInfo();
                    _elem310.read(iprot);
                    _val307.add(_elem310);
                  }
                  iprot.readListEnd();
                }
                this.part_hosts?[_key306] = _val307;
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
    if (this.part_hosts != null) {
      oprot.writeFieldBegin(_PART_HOSTS_FIELD_DESC);
      {
        oprot.writeMapBegin(
            new TMap(TType.I32, TType.LIST, this.part_hosts?.length));
        for (var elem312 in this.part_hosts?.keys ?? <int>[]) {
          oprot.writeI32(elem312);
          {
            oprot.writeListBegin(
                new TList(TType.STRUCT, this.part_hosts?[elem312]?.length));
            for (var elem313 in this.part_hosts?[elem312] ?? <PartInfo>[]) {
              elem313.write(oprot);
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
    StringBuffer ret = new StringBuffer("RestoreMetaResp(");

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
    ret.write("part_hosts:");
    if (this.part_hosts == null) {
      ret.write("null");
    } else {
      ret.write(this.part_hosts);
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
