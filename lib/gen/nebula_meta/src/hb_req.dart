// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.hb_req;

import 'dart:typed_data' show Int8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class HBReq implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("HBReq");
  static final TField _ROLE_FIELD_DESC = new TField("role", TType.I32, 1);
  static final TField _HOST_FIELD_DESC = new TField("host", TType.STRUCT, 2);
  static final TField _CLUSTER_ID_FIELD_DESC =
      new TField("cluster_id", TType.I64, 3);
  static final TField _LEADER_PART_IDS_FIELD_DESC =
      new TField("leader_partIds", TType.MAP, 4);
  static final TField _GIT_INFO_SHA_FIELD_DESC =
      new TField("git_info_sha", TType.STRING, 5);
  static final TField _DISK_PARTS_FIELD_DESC =
      new TField("disk_parts", TType.MAP, 6);
  static final TField _DIR_FIELD_DESC = new TField("dir", TType.STRUCT, 7);
  static final TField _VERSION_FIELD_DESC =
      new TField("version", TType.STRING, 8);

  int? _role;
  static const int ROLE = 1;
  t_nebula.HostAddr? _host;
  static const int HOST = 2;
  int _cluster_id = 0;
  static const int CLUSTER_ID = 3;
  Map<int, List<LeaderInfo>>? _leader_partIds;
  static const int LEADER_PARTIDS = 4;
  Int8List? _git_info_sha;
  static const int GIT_INFO_SHA = 5;
  Map<int, Map<Int8List, PartitionList>>? _disk_parts;
  static const int DISK_PARTS = 6;
  t_nebula.DirInfo? _dir;
  static const int DIR = 7;
  Int8List? _version;
  static const int VERSION = 8;

  bool __isset_role = false;
  bool __isset_cluster_id = false;

  HBReq() {}

  // role
  int? get role => this._role;

  set role(int? role) {
    this._role = role;
    this.__isset_role = true;
  }

  bool isSetRole() => this.__isset_role;

  unsetRole() {
    this.__isset_role = false;
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

  // cluster_id
  int get cluster_id => this._cluster_id;

  set cluster_id(int cluster_id) {
    this._cluster_id = cluster_id;
    this.__isset_cluster_id = true;
  }

  bool isSetCluster_id() => this.__isset_cluster_id;

  unsetCluster_id() {
    this.__isset_cluster_id = false;
  }

  // leader_partIds
  Map<int, List<LeaderInfo>>? get leader_partIds => this._leader_partIds;

  set leader_partIds(Map<int, List<LeaderInfo>>? leader_partIds) {
    this._leader_partIds = leader_partIds;
  }

  bool isSetLeader_partIds() => this.leader_partIds != null;

  unsetLeader_partIds() {
    this.leader_partIds = null;
  }

  // git_info_sha
  Int8List? get git_info_sha => this._git_info_sha;

  set git_info_sha(Int8List? git_info_sha) {
    this._git_info_sha = git_info_sha;
  }

  bool isSetGit_info_sha() => this.git_info_sha != null;

  unsetGit_info_sha() {
    this.git_info_sha = null;
  }

  // disk_parts
  Map<int, Map<Int8List, PartitionList>>? get disk_parts => this._disk_parts;

  set disk_parts(Map<int, Map<Int8List, PartitionList>>? disk_parts) {
    this._disk_parts = disk_parts;
  }

  bool isSetDisk_parts() => this.disk_parts != null;

  unsetDisk_parts() {
    this.disk_parts = null;
  }

  // dir
  t_nebula.DirInfo? get dir => this._dir;

  set dir(t_nebula.DirInfo? dir) {
    this._dir = dir;
  }

  bool isSetDir() => this.dir != null;

  unsetDir() {
    this.dir = null;
  }

  // version
  Int8List? get version => this._version;

  set version(Int8List? version) {
    this._version = version;
  }

  bool isSetVersion() => this.version != null;

  unsetVersion() {
    this.version = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case ROLE:
        return this.role;
      case HOST:
        return this.host;
      case CLUSTER_ID:
        return this.cluster_id;
      case LEADER_PARTIDS:
        return this.leader_partIds;
      case GIT_INFO_SHA:
        return this.git_info_sha;
      case DISK_PARTS:
        return this.disk_parts;
      case DIR:
        return this.dir;
      case VERSION:
        return this.version;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case ROLE:
        if (value == null) {
          unsetRole();
        } else {
          this.role = value as int?;
        }
        break;

      case HOST:
        if (value == null) {
          unsetHost();
        } else {
          this.host = value as t_nebula.HostAddr?;
        }
        break;

      case CLUSTER_ID:
        if (value == null) {
          unsetCluster_id();
        } else {
          this.cluster_id = value as int;
        }
        break;

      case LEADER_PARTIDS:
        if (value == null) {
          unsetLeader_partIds();
        } else {
          this.leader_partIds = value as Map<int, List<LeaderInfo>>?;
        }
        break;

      case GIT_INFO_SHA:
        if (value == null) {
          unsetGit_info_sha();
        } else {
          this.git_info_sha = value as Int8List?;
        }
        break;

      case DISK_PARTS:
        if (value == null) {
          unsetDisk_parts();
        } else {
          this.disk_parts = value as Map<int, Map<Int8List, PartitionList>>?;
        }
        break;

      case DIR:
        if (value == null) {
          unsetDir();
        } else {
          this.dir = value as t_nebula.DirInfo?;
        }
        break;

      case VERSION:
        if (value == null) {
          unsetVersion();
        } else {
          this.version = value as Int8List?;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case ROLE:
        return isSetRole();
      case HOST:
        return isSetHost();
      case CLUSTER_ID:
        return isSetCluster_id();
      case LEADER_PARTIDS:
        return isSetLeader_partIds();
      case GIT_INFO_SHA:
        return isSetGit_info_sha();
      case DISK_PARTS:
        return isSetDisk_parts();
      case DIR:
        return isSetDir();
      case VERSION:
        return isSetVersion();
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
        case ROLE:
          if (field.type == TType.I32) {
            this.role = iprot.readI32();
            this.__isset_role = true;
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
        case CLUSTER_ID:
          if (field.type == TType.I64) {
            this.cluster_id = iprot.readI64();
            this.__isset_cluster_id = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case LEADER_PARTIDS:
          if (field.type == TType.MAP) {
            {
              TMap _map152 = iprot.readMapBegin();
              this.leader_partIds = new Map<int, List<LeaderInfo>>();
              for (int _i153 = 0; _i153 < _map152.length; ++_i153) {
                int _key154;
                List<LeaderInfo> _val155;
                _key154 = iprot.readI32();
                {
                  TList _list156 = iprot.readListBegin();
                  _val155 = <LeaderInfo>[];
                  for (int _i157 = 0; _i157 < _list156.length; ++_i157) {
                    LeaderInfo _elem158;
                    _elem158 = new LeaderInfo();
                    _elem158.read(iprot);
                    _val155.add(_elem158);
                  }
                  iprot.readListEnd();
                }
                this.leader_partIds?[_key154] = _val155;
              }
              iprot.readMapEnd();
            }
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case GIT_INFO_SHA:
          if (field.type == TType.STRING) {
            this.git_info_sha = iprot.readBinary();
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case DISK_PARTS:
          if (field.type == TType.MAP) {
            {
              TMap _map159 = iprot.readMapBegin();
              this.disk_parts = new Map<int, Map<Int8List, PartitionList>>();
              for (int _i160 = 0; _i160 < _map159.length; ++_i160) {
                int _key161;
                Map<Int8List, PartitionList> _val162;
                _key161 = iprot.readI32();
                {
                  TMap _map163 = iprot.readMapBegin();
                  _val162 = new Map<Int8List, PartitionList>();
                  for (int _i164 = 0; _i164 < _map163.length; ++_i164) {
                    Int8List _key165;
                    PartitionList _val166;
                    _key165 = iprot.readBinary();
                    _val166 = new PartitionList();
                    _val166.read(iprot);
                    _val162[_key165] = _val166;
                  }
                  iprot.readMapEnd();
                }
                this.disk_parts?[_key161] = _val162;
              }
              iprot.readMapEnd();
            }
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case DIR:
          if (field.type == TType.STRUCT) {
            this.dir = new t_nebula.DirInfo();
            this.dir?.read(iprot);
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case VERSION:
          if (field.type == TType.STRING) {
            this.version = iprot.readBinary();
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
    oprot.writeFieldBegin(_ROLE_FIELD_DESC);
    oprot.writeI32(this.role);
    oprot.writeFieldEnd();
    if (this.host != null) {
      oprot.writeFieldBegin(_HOST_FIELD_DESC);
      this.host?.write(oprot);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldBegin(_CLUSTER_ID_FIELD_DESC);
    oprot.writeI64(this.cluster_id);
    oprot.writeFieldEnd();
    if (isSetLeader_partIds()) {
      if (this.leader_partIds != null) {
        oprot.writeFieldBegin(_LEADER_PART_IDS_FIELD_DESC);
        {
          oprot.writeMapBegin(
              new TMap(TType.I32, TType.LIST, this.leader_partIds?.length));
          for (var elem168 in this.leader_partIds?.keys ?? <int>[]) {
            oprot.writeI32(elem168);
            {
              oprot.writeListBegin(new TList(
                  TType.STRUCT, this.leader_partIds?[elem168]?.length));
              for (var elem169
                  in this.leader_partIds?[elem168] ?? <LeaderInfo>[]) {
                elem169.write(oprot);
              }
              oprot.writeListEnd();
            }
          }
          oprot.writeMapEnd();
        }
        oprot.writeFieldEnd();
      }
    }
    if (this.git_info_sha != null) {
      oprot.writeFieldBegin(_GIT_INFO_SHA_FIELD_DESC);
      oprot.writeBinary(this.git_info_sha);
      oprot.writeFieldEnd();
    }
    if (isSetDisk_parts()) {
      if (this.disk_parts != null) {
        oprot.writeFieldBegin(_DISK_PARTS_FIELD_DESC);
        {
          oprot.writeMapBegin(
              new TMap(TType.I32, TType.MAP, this.disk_parts?.length));
          for (var elem171 in this.disk_parts?.keys ?? <int>[]) {
            oprot.writeI32(elem171);
            {
              oprot.writeMapBegin(new TMap(TType.STRING, TType.STRUCT,
                  this.disk_parts?[elem171]?.length));
              for (var elem173
                  in this.disk_parts?[elem171]?.keys ?? <Int8List>[]) {
                oprot.writeBinary(elem173);
                this.disk_parts?[elem171]?[elem173]?.write(oprot);
              }
              oprot.writeMapEnd();
            }
          }
          oprot.writeMapEnd();
        }
        oprot.writeFieldEnd();
      }
    }
    if (isSetDir()) {
      if (this.dir != null) {
        oprot.writeFieldBegin(_DIR_FIELD_DESC);
        this.dir?.write(oprot);
        oprot.writeFieldEnd();
      }
    }
    if (isSetVersion()) {
      if (this.version != null) {
        oprot.writeFieldBegin(_VERSION_FIELD_DESC);
        oprot.writeBinary(this.version);
        oprot.writeFieldEnd();
      }
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("HBReq(");

    ret.write("role:");
    String? role_name = HostRole.VALUES_TO_NAMES[this.role];
    if (role_name != null) {
      ret.write(role_name);
      ret.write(" (");
    }
    ret.write(this.role);
    if (role_name != null) {
      ret.write(")");
    }

    ret.write(", ");
    ret.write("host:");
    if (this.host == null) {
      ret.write("null");
    } else {
      ret.write(this.host);
    }

    ret.write(", ");
    ret.write("cluster_id:");
    ret.write(this.cluster_id);

    if (isSetLeader_partIds()) {
      ret.write(", ");
      ret.write("leader_partIds:");
      if (this.leader_partIds == null) {
        ret.write("null");
      } else {
        ret.write(this.leader_partIds);
      }
    }

    ret.write(", ");
    ret.write("git_info_sha:");
    if (this.git_info_sha == null) {
      ret.write("null");
    } else {
      ret.write("BINARY");
    }

    if (isSetDisk_parts()) {
      ret.write(", ");
      ret.write("disk_parts:");
      if (this.disk_parts == null) {
        ret.write("null");
      } else {
        ret.write(this.disk_parts);
      }
    }

    if (isSetDir()) {
      ret.write(", ");
      ret.write("dir:");
      if (this.dir == null) {
        ret.write("null");
      } else {
        ret.write(this.dir);
      }
    }

    if (isSetVersion()) {
      ret.write(", ");
      ret.write("version:");
      if (this.version == null) {
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
    if (isSetRole() && !HostRole.VALID_VALUES.contains(role)) {
      throw new TProtocolError(TProtocolErrorType.UNKNOWN,
          "The field 'role' has been assigned the invalid value $role");
    }
  }
}
