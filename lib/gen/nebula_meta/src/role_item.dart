// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.role_item;

import 'dart:typed_data' show Int8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class RoleItem implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("RoleItem");
  static final TField _USER_ID_FIELD_DESC =
      new TField("user_id", TType.STRING, 1);
  static final TField _SPACE_ID_FIELD_DESC =
      new TField("space_id", TType.I32, 2);
  static final TField _ROLE_TYPE_FIELD_DESC =
      new TField("role_type", TType.I32, 3);

  Int8List? _user_id;
  static const int USER_ID = 1;
  int _space_id = 0;
  static const int SPACE_ID = 2;
  int? _role_type;
  static const int ROLE_TYPE = 3;

  bool __isset_space_id = false;
  bool __isset_role_type = false;

  RoleItem() {}

  // user_id
  Int8List? get user_id => this._user_id;

  set user_id(Int8List? user_id) {
    this._user_id = user_id;
  }

  bool isSetUser_id() => this.user_id != null;

  unsetUser_id() {
    this.user_id = null;
  }

  // space_id
  int get space_id => this._space_id;

  set space_id(int space_id) {
    this._space_id = space_id;
    this.__isset_space_id = true;
  }

  bool isSetSpace_id() => this.__isset_space_id;

  unsetSpace_id() {
    this.__isset_space_id = false;
  }

  // role_type
  int? get role_type => this._role_type;

  set role_type(int? role_type) {
    this._role_type = role_type;
    this.__isset_role_type = true;
  }

  bool isSetRole_type() => this.__isset_role_type;

  unsetRole_type() {
    this.__isset_role_type = false;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case USER_ID:
        return this.user_id;
      case SPACE_ID:
        return this.space_id;
      case ROLE_TYPE:
        return this.role_type;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case USER_ID:
        if (value == null) {
          unsetUser_id();
        } else {
          this.user_id = value as Int8List?;
        }
        break;

      case SPACE_ID:
        if (value == null) {
          unsetSpace_id();
        } else {
          this.space_id = value as int;
        }
        break;

      case ROLE_TYPE:
        if (value == null) {
          unsetRole_type();
        } else {
          this.role_type = value as int?;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case USER_ID:
        return isSetUser_id();
      case SPACE_ID:
        return isSetSpace_id();
      case ROLE_TYPE:
        return isSetRole_type();
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
        case USER_ID:
          if (field.type == TType.STRING) {
            this.user_id = iprot.readBinary();
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case SPACE_ID:
          if (field.type == TType.I32) {
            this.space_id = iprot.readI32();
            this.__isset_space_id = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case ROLE_TYPE:
          if (field.type == TType.I32) {
            this.role_type = iprot.readI32();
            this.__isset_role_type = true;
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
    if (this.user_id != null) {
      oprot.writeFieldBegin(_USER_ID_FIELD_DESC);
      oprot.writeBinary(this.user_id);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldBegin(_SPACE_ID_FIELD_DESC);
    oprot.writeI32(this.space_id);
    oprot.writeFieldEnd();
    oprot.writeFieldBegin(_ROLE_TYPE_FIELD_DESC);
    oprot.writeI32(this.role_type);
    oprot.writeFieldEnd();
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("RoleItem(");

    ret.write("user_id:");
    if (this.user_id == null) {
      ret.write("null");
    } else {
      ret.write("BINARY");
    }

    ret.write(", ");
    ret.write("space_id:");
    ret.write(this.space_id);

    ret.write(", ");
    ret.write("role_type:");
    String? role_type_name = RoleType.VALUES_TO_NAMES[this.role_type];
    if (role_type_name != null) {
      ret.write(role_type_name);
      ret.write(" (");
    }
    ret.write(this.role_type);
    if (role_type_name != null) {
      ret.write(")");
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
    if (isSetRole_type() && !RoleType.VALID_VALUES.contains(role_type)) {
      throw new TProtocolError(TProtocolErrorType.UNKNOWN,
          "The field 'role_type' has been assigned the invalid value $role_type");
    }
  }
}
