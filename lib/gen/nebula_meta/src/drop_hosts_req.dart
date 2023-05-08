/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.drop_hosts_req;

import 'dart:typed_data' show Uint8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class DropHostsReq implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("DropHostsReq");
  static final TField _HOSTS_FIELD_DESC = new TField("hosts", TType.LIST, 1);

  List<t_nebula.HostAddr>? _hosts;
  static const int HOSTS = 1;

  DropHostsReq() {}

  // hosts
  List<t_nebula.HostAddr>? get hosts => this._hosts;

  set hosts(List<t_nebula.HostAddr>? hosts) {
    this._hosts = hosts;
  }

  bool isSetHosts() => this.hosts != null;

  unsetHosts() {
    this.hosts = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case HOSTS:
        return this.hosts;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case HOSTS:
        if (value == null) {
          unsetHosts();
        } else {
          this.hosts = value as List<t_nebula.HostAddr>?;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case HOSTS:
        return isSetHosts();
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
        case HOSTS:
          if (field.type == TType.LIST) {
            {
              TList _list108 = iprot.readListBegin();
              this.hosts = <t_nebula.HostAddr>[];
              for (int _i109 = 0; _i109 < _list108.length; ++_i109) {
                t_nebula.HostAddr _elem110;
                _elem110 = new t_nebula.HostAddr();
                _elem110.read(iprot);
                this.hosts?.add(_elem110);
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
    if (this.hosts != null) {
      oprot.writeFieldBegin(_HOSTS_FIELD_DESC);
      {
        oprot.writeListBegin(new TList(TType.STRUCT, this.hosts?.length));
        for (var elem111 in this.hosts ?? []) {
          elem111.write(oprot);
        }
        oprot.writeListEnd();
      }
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("DropHostsReq(");

    ret.write("hosts:");
    if (this.hosts == null) {
      ret.write("null");
    } else {
      ret.write(this.hosts);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
