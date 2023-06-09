// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.index_status;

import 'dart:typed_data' show Int8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class IndexStatus implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("IndexStatus");
  static final TField _NAME_FIELD_DESC = new TField("name", TType.STRING, 1);
  static final TField _STATUS_FIELD_DESC =
      new TField("status", TType.STRING, 2);

  Int8List? _name;
  static const int NAME = 1;
  Int8List? _status;
  static const int STATUS = 2;

  IndexStatus() {}

  // name
  Int8List? get name => this._name;

  set name(Int8List? name) {
    this._name = name;
  }

  bool isSetName() => this.name != null;

  unsetName() {
    this.name = null;
  }

  // status
  Int8List? get status => this._status;

  set status(Int8List? status) {
    this._status = status;
  }

  bool isSetStatus() => this.status != null;

  unsetStatus() {
    this.status = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case NAME:
        return this.name;
      case STATUS:
        return this.status;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case NAME:
        if (value == null) {
          unsetName();
        } else {
          this.name = value as Int8List?;
        }
        break;

      case STATUS:
        if (value == null) {
          unsetStatus();
        } else {
          this.status = value as Int8List?;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case NAME:
        return isSetName();
      case STATUS:
        return isSetStatus();
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
        case NAME:
          if (field.type == TType.STRING) {
            this.name = iprot.readBinary();
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case STATUS:
          if (field.type == TType.STRING) {
            this.status = iprot.readBinary();
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
    if (this.name != null) {
      oprot.writeFieldBegin(_NAME_FIELD_DESC);
      oprot.writeBinary(this.name);
      oprot.writeFieldEnd();
    }
    if (this.status != null) {
      oprot.writeFieldBegin(_STATUS_FIELD_DESC);
      oprot.writeBinary(this.status);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("IndexStatus(");

    ret.write("name:");
    if (this.name == null) {
      ret.write("null");
    } else {
      ret.write("BINARY");
    }

    ret.write(", ");
    ret.write("status:");
    if (this.status == null) {
      ret.write("null");
    } else {
      ret.write("BINARY");
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
