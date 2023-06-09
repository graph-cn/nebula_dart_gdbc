// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.create_space_req;

import 'dart:typed_data' show Uint8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class CreateSpaceReq implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("CreateSpaceReq");
  static final TField _PROPERTIES_FIELD_DESC =
      new TField("properties", TType.STRUCT, 1);
  static final TField _IF_NOT_EXISTS_FIELD_DESC =
      new TField("if_not_exists", TType.BOOL, 2);

  SpaceDesc? _properties;
  static const int PROPERTIES = 1;
  bool _if_not_exists = false;
  static const int IF_NOT_EXISTS = 2;

  bool __isset_if_not_exists = false;

  CreateSpaceReq() {}

  // properties
  SpaceDesc? get properties => this._properties;

  set properties(SpaceDesc? properties) {
    this._properties = properties;
  }

  bool isSetProperties() => this.properties != null;

  unsetProperties() {
    this.properties = null;
  }

  // if_not_exists
  bool get if_not_exists => this._if_not_exists;

  set if_not_exists(bool if_not_exists) {
    this._if_not_exists = if_not_exists;
    this.__isset_if_not_exists = true;
  }

  bool isSetIf_not_exists() => this.__isset_if_not_exists;

  unsetIf_not_exists() {
    this.__isset_if_not_exists = false;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case PROPERTIES:
        return this.properties;
      case IF_NOT_EXISTS:
        return this.if_not_exists;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case PROPERTIES:
        if (value == null) {
          unsetProperties();
        } else {
          this.properties = value as SpaceDesc?;
        }
        break;

      case IF_NOT_EXISTS:
        if (value == null) {
          unsetIf_not_exists();
        } else {
          this.if_not_exists = value as bool;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case PROPERTIES:
        return isSetProperties();
      case IF_NOT_EXISTS:
        return isSetIf_not_exists();
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
        case PROPERTIES:
          if (field.type == TType.STRUCT) {
            this.properties = new SpaceDesc();
            this.properties?.read(iprot);
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case IF_NOT_EXISTS:
          if (field.type == TType.BOOL) {
            this.if_not_exists = iprot.readBool();
            this.__isset_if_not_exists = true;
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
    if (this.properties != null) {
      oprot.writeFieldBegin(_PROPERTIES_FIELD_DESC);
      this.properties?.write(oprot);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldBegin(_IF_NOT_EXISTS_FIELD_DESC);
    oprot.writeBool(this.if_not_exists);
    oprot.writeFieldEnd();
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("CreateSpaceReq(");

    ret.write("properties:");
    if (this.properties == null) {
      ret.write("null");
    } else {
      ret.write(this.properties);
    }

    ret.write(", ");
    ret.write("if_not_exists:");
    ret.write(this.if_not_exists);

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
