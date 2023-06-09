// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_storage.src.exec_response;

import 'dart:typed_data' show Uint8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_storage/nebula_storage.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart'
    as t_nebula_meta;

class ExecResponse implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("ExecResponse");
  static final TField _RESULT_FIELD_DESC =
      new TField("result", TType.STRUCT, 1);

  ResponseCommon? _result;
  static const int RESULT = 1;

  ExecResponse() {}

  // result
  ResponseCommon? get result => this._result;

  set result(ResponseCommon? result) {
    this._result = result;
  }

  bool isSetResult() => this.result != null;

  unsetResult() {
    this.result = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case RESULT:
        return this.result;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case RESULT:
        if (value == null) {
          unsetResult();
        } else {
          this.result = value as ResponseCommon?;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case RESULT:
        return isSetResult();
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
        case RESULT:
          if (field.type == TType.STRUCT) {
            this.result = new ResponseCommon();
            this.result?.read(iprot);
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
    if (this.result != null) {
      oprot.writeFieldBegin(_RESULT_FIELD_DESC);
      this.result?.write(oprot);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("ExecResponse(");

    ret.write("result:");
    if (this.result == null) {
      ret.write("null");
    } else {
      ret.write(this.result);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    if (result == null) {
      throw new TProtocolError(TProtocolErrorType.UNKNOWN,
          "Required field 'result' was not present! Struct: ${toString()}");
    }
    // check that fields of type enum have valid values
  }
}
