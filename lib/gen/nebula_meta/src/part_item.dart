// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.part_item;

import 'dart:typed_data' show Uint8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class PartItem implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("PartItem");
  static final TField _PART_ID_FIELD_DESC = new TField("part_id", TType.I32, 1);
  static final TField _LEADER_FIELD_DESC =
      new TField("leader", TType.STRUCT, 2);
  static final TField _PEERS_FIELD_DESC = new TField("peers", TType.LIST, 3);
  static final TField _LOSTS_FIELD_DESC = new TField("losts", TType.LIST, 4);

  int? _part_id = 0;
  static const int PART_ID = 1;
  t_nebula.HostAddr? _leader;
  static const int LEADER = 2;
  List<t_nebula.HostAddr>? _peers;
  static const int PEERS = 3;
  List<t_nebula.HostAddr>? _losts;
  static const int LOSTS = 4;

  bool __isset_part_id = false;

  PartItem() {}

  // part_id
  int? get part_id => this._part_id;

  set part_id(int? part_id) {
    this._part_id = part_id;
    this.__isset_part_id = true;
  }

  bool isSetPart_id() => this.__isset_part_id;

  unsetPart_id() {
    this.__isset_part_id = false;
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

  // peers
  List<t_nebula.HostAddr>? get peers => this._peers;

  set peers(List<t_nebula.HostAddr>? peers) {
    this._peers = peers;
  }

  bool isSetPeers() => this.peers != null;

  unsetPeers() {
    this.peers = null;
  }

  // losts
  List<t_nebula.HostAddr>? get losts => this._losts;

  set losts(List<t_nebula.HostAddr>? losts) {
    this._losts = losts;
  }

  bool isSetLosts() => this.losts != null;

  unsetLosts() {
    this.losts = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case PART_ID:
        return this.part_id;
      case LEADER:
        return this.leader;
      case PEERS:
        return this.peers;
      case LOSTS:
        return this.losts;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case PART_ID:
        if (value == null) {
          unsetPart_id();
        } else {
          this.part_id = value as int?;
        }
        break;

      case LEADER:
        if (value == null) {
          unsetLeader();
        } else {
          this.leader = value as t_nebula.HostAddr?;
        }
        break;

      case PEERS:
        if (value == null) {
          unsetPeers();
        } else {
          this.peers = value as List<t_nebula.HostAddr>?;
        }
        break;

      case LOSTS:
        if (value == null) {
          unsetLosts();
        } else {
          this.losts = value as List<t_nebula.HostAddr>?;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case PART_ID:
        return isSetPart_id();
      case LEADER:
        return isSetLeader();
      case PEERS:
        return isSetPeers();
      case LOSTS:
        return isSetLosts();
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
        case PART_ID:
          if (field.type == TType.I32) {
            this.part_id = iprot.readI32();
            this.__isset_part_id = true;
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
        case PEERS:
          if (field.type == TType.LIST) {
            {
              TList _list116 = iprot.readListBegin();
              this.peers = <t_nebula.HostAddr>[];
              for (int _i117 = 0; _i117 < _list116.length; ++_i117) {
                t_nebula.HostAddr _elem118;
                _elem118 = new t_nebula.HostAddr();
                _elem118.read(iprot);
                this.peers?.add(_elem118);
              }
              iprot.readListEnd();
            }
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case LOSTS:
          if (field.type == TType.LIST) {
            {
              TList _list119 = iprot.readListBegin();
              this.losts = <t_nebula.HostAddr>[];
              for (int _i120 = 0; _i120 < _list119.length; ++_i120) {
                t_nebula.HostAddr _elem121;
                _elem121 = new t_nebula.HostAddr();
                _elem121.read(iprot);
                this.losts?.add(_elem121);
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
    if (!__isset_part_id) {
      throw new TProtocolError(
          TProtocolErrorType.UNKNOWN,
          "Required field 'part_id' was not found in serialized data! Struct: " +
              toString());
    }

    validate();
  }

  write(TProtocol oprot) {
    validate();

    oprot.writeStructBegin(_STRUCT_DESC);
    oprot.writeFieldBegin(_PART_ID_FIELD_DESC);
    oprot.writeI32(this.part_id);
    oprot.writeFieldEnd();
    if (isSetLeader()) {
      if (this.leader != null) {
        oprot.writeFieldBegin(_LEADER_FIELD_DESC);
        this.leader?.write(oprot);
        oprot.writeFieldEnd();
      }
    }
    if (this.peers != null) {
      oprot.writeFieldBegin(_PEERS_FIELD_DESC);
      {
        oprot.writeListBegin(new TList(TType.STRUCT, this.peers?.length));
        for (var elem122 in this.peers ?? []) {
          elem122.write(oprot);
        }
        oprot.writeListEnd();
      }
      oprot.writeFieldEnd();
    }
    if (this.losts != null) {
      oprot.writeFieldBegin(_LOSTS_FIELD_DESC);
      {
        oprot.writeListBegin(new TList(TType.STRUCT, this.losts?.length));
        for (var elem123 in this.losts ?? []) {
          elem123.write(oprot);
        }
        oprot.writeListEnd();
      }
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("PartItem(");

    ret.write("part_id:");
    ret.write(this.part_id);

    if (isSetLeader()) {
      ret.write(", ");
      ret.write("leader:");
      if (this.leader == null) {
        ret.write("null");
      } else {
        ret.write(this.leader);
      }
    }

    ret.write(", ");
    ret.write("peers:");
    if (this.peers == null) {
      ret.write("null");
    } else {
      ret.write(this.peers);
    }

    ret.write(", ");
    ret.write("losts:");
    if (this.losts == null) {
      ret.write("null");
    } else {
      ret.write(this.losts);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // alas, we cannot check 'part_id' because it's a primitive and you chose the non-beans generator.
    if (peers == null) {
      throw new TProtocolError(TProtocolErrorType.UNKNOWN,
          "Required field 'peers' was not present! Struct: " + toString());
    }
    if (losts == null) {
      throw new TProtocolError(TProtocolErrorType.UNKNOWN,
          "Required field 'losts' was not present! Struct: " + toString());
    }
    // check that fields of type enum have valid values
  }
}
