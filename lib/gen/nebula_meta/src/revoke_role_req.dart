// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.revoke_role_req;

import 'dart:typed_data' show Uint8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class RevokeRoleReq implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("RevokeRoleReq");
  static final TField _ROLE_ITEM_FIELD_DESC =
      new TField("role_item", TType.STRUCT, 1);

  RoleItem? _role_item;
  static const int ROLE_ITEM = 1;

  RevokeRoleReq() {}

  // role_item
  RoleItem? get role_item => this._role_item;

  set role_item(RoleItem? role_item) {
    this._role_item = role_item;
  }

  bool isSetRole_item() => this.role_item != null;

  unsetRole_item() {
    this.role_item = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case ROLE_ITEM:
        return this.role_item;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case ROLE_ITEM:
        if (value == null) {
          unsetRole_item();
        } else {
          this.role_item = value as RoleItem;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case ROLE_ITEM:
        return isSetRole_item();
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
        case ROLE_ITEM:
          if (field.type == TType.STRUCT) {
            this.role_item = new RoleItem();
            this.role_item?.read(iprot);
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
    if (this.role_item != null) {
      oprot.writeFieldBegin(_ROLE_ITEM_FIELD_DESC);
      this.role_item?.write(oprot);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("RevokeRoleReq(");

    ret.write("role_item:");
    if (this.role_item == null) {
      ret.write("null");
    } else {
      ret.write(this.role_item);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
