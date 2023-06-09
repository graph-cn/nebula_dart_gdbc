// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.leader_info;

import 'dart:typed_data' show Uint8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class LeaderInfo implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("LeaderInfo");
  static final TField _PART_ID_FIELD_DESC = new TField("part_id", TType.I32, 1);
  static final TField _TERM_FIELD_DESC = new TField("term", TType.I64, 2);

  int _part_id = 0;
  static const int PART_ID = 1;
  int _term = 0;
  static const int TERM = 2;

  bool __isset_part_id = false;
  bool __isset_term = false;

  LeaderInfo() {}

  // part_id
  int get part_id => this._part_id;

  set part_id(int part_id) {
    this._part_id = part_id;
    this.__isset_part_id = true;
  }

  bool isSetPart_id() => this.__isset_part_id;

  unsetPart_id() {
    this.__isset_part_id = false;
  }

  // term
  int get term => this._term;

  set term(int term) {
    this._term = term;
    this.__isset_term = true;
  }

  bool isSetTerm() => this.__isset_term;

  unsetTerm() {
    this.__isset_term = false;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case PART_ID:
        return this.part_id;
      case TERM:
        return this.term;
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
          this.part_id = value as int;
        }
        break;

      case TERM:
        if (value == null) {
          unsetTerm();
        } else {
          this.term = value as int;
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
      case TERM:
        return isSetTerm();
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
        case TERM:
          if (field.type == TType.I64) {
            this.term = iprot.readI64();
            this.__isset_term = true;
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
    oprot.writeFieldBegin(_PART_ID_FIELD_DESC);
    oprot.writeI32(this.part_id);
    oprot.writeFieldEnd();
    oprot.writeFieldBegin(_TERM_FIELD_DESC);
    oprot.writeI64(this.term);
    oprot.writeFieldEnd();
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("LeaderInfo(");

    ret.write("part_id:");
    ret.write(this.part_id);

    ret.write(", ");
    ret.write("term:");
    ret.write(this.term);

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
