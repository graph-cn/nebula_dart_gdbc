// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_storage.src.get_leader_parts_resp;

import 'dart:typed_data' show Uint8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_storage/nebula_storage.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart'
    as t_nebula_meta;

class GetLeaderPartsResp implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("GetLeaderPartsResp");
  static final TField _CODE_FIELD_DESC = new TField("code", TType.I32, 1);
  static final TField _LEADER_PARTS_FIELD_DESC =
      new TField("leader_parts", TType.MAP, 2);

  int? _code;
  static const int CODE = 1;
  Map<int, List<int>>? _leader_parts;
  static const int LEADER_PARTS = 2;

  bool __isset_code = false;

  GetLeaderPartsResp() {}

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

  // leader_parts
  Map<int, List<int>>? get leader_parts => this._leader_parts;

  set leader_parts(Map<int, List<int>>? leader_parts) {
    this._leader_parts = leader_parts;
  }

  bool isSetLeader_parts() => this.leader_parts != null;

  unsetLeader_parts() {
    this.leader_parts = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case CODE:
        return this.code;
      case LEADER_PARTS:
        return this.leader_parts;
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

      case LEADER_PARTS:
        if (value == null) {
          unsetLeader_parts();
        } else {
          this.leader_parts = value as Map<int, List<int>>?;
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
      case LEADER_PARTS:
        return isSetLeader_parts();
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
        case LEADER_PARTS:
          if (field.type == TType.MAP) {
            {
              TMap _map310 = iprot.readMapBegin();
              this.leader_parts = new Map<int, List<int>>();
              for (int _i311 = 0; _i311 < _map310.length; ++_i311) {
                int _key312;
                List<int> _val313;
                _key312 = iprot.readI32();
                {
                  TList _list314 = iprot.readListBegin();
                  _val313 = <int>[];
                  for (int _i315 = 0; _i315 < _list314.length; ++_i315) {
                    int _elem316;
                    _elem316 = iprot.readI32();
                    _val313.add(_elem316);
                  }
                  iprot.readListEnd();
                }
                this.leader_parts?[_key312] = _val313;
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
    if (this.leader_parts != null) {
      oprot.writeFieldBegin(_LEADER_PARTS_FIELD_DESC);
      {
        oprot.writeMapBegin(
            new TMap(TType.I32, TType.LIST, this.leader_parts?.length));
        for (var elem318 in this.leader_parts?.keys ?? <int>[]) {
          oprot.writeI32(elem318);
          {
            oprot.writeListBegin(
                new TList(TType.I32, this.leader_parts?[elem318]?.length));
            for (var elem319 in this.leader_parts?[elem318] ?? <int>[]) {
              oprot.writeI32(elem319);
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
    StringBuffer ret = new StringBuffer("GetLeaderPartsResp(");

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
    ret.write("leader_parts:");
    if (this.leader_parts == null) {
      ret.write("null");
    } else {
      ret.write(this.leader_parts);
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
