// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_storage.src.scan_cursor;

import 'dart:typed_data' show Int8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_storage/nebula_storage.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart'
    as t_nebula_meta;

class ScanCursor implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("ScanCursor");
  static final TField _NEXT_CURSOR_FIELD_DESC =
      new TField("next_cursor", TType.STRING, 1);

  Int8List? _next_cursor;
  static const int NEXT_CURSOR = 1;

  ScanCursor() {}

  // next_cursor
  Int8List? get next_cursor => this._next_cursor;

  set next_cursor(Int8List? next_cursor) {
    this._next_cursor = next_cursor;
  }

  bool isSetNext_cursor() => this.next_cursor != null;

  unsetNext_cursor() {
    this.next_cursor = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case NEXT_CURSOR:
        return this.next_cursor;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case NEXT_CURSOR:
        if (value == null) {
          unsetNext_cursor();
        } else {
          this.next_cursor = value as Int8List?;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case NEXT_CURSOR:
        return isSetNext_cursor();
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
        case NEXT_CURSOR:
          if (field.type == TType.STRING) {
            this.next_cursor = iprot.readBinary();
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
    if (isSetNext_cursor()) {
      if (this.next_cursor != null) {
        oprot.writeFieldBegin(_NEXT_CURSOR_FIELD_DESC);
        oprot.writeBinary(this.next_cursor);
        oprot.writeFieldEnd();
      }
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("ScanCursor(");

    if (isSetNext_cursor()) {
      ret.write("next_cursor:");
      if (this.next_cursor == null) {
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
  }
}
