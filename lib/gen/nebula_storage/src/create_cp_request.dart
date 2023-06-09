// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_storage.src.create_cp_request;

import 'dart:typed_data' show Int8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_storage/nebula_storage.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart'
    as t_nebula_meta;

class CreateCPRequest implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("CreateCPRequest");
  static final TField _SPACE_IDS_FIELD_DESC =
      new TField("space_ids", TType.LIST, 1);
  static final TField _NAME_FIELD_DESC = new TField("name", TType.STRING, 2);

  List<int>? _space_ids;
  static const int SPACE_IDS = 1;
  Int8List? _name;
  static const int NAME = 2;

  CreateCPRequest() {}

  // space_ids
  List<int>? get space_ids => this._space_ids;

  set space_ids(List<int>? space_ids) {
    this._space_ids = space_ids;
  }

  bool isSetSpace_ids() => this.space_ids != null;

  unsetSpace_ids() {
    this.space_ids = null;
  }

  // name
  Int8List? get name => this._name;

  set name(Int8List? name) {
    this._name = name;
  }

  bool isSetName() => this.name != null;

  unsetName() {
    this.name = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case SPACE_IDS:
        return this.space_ids;
      case NAME:
        return this.name;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case SPACE_IDS:
        if (value == null) {
          unsetSpace_ids();
        } else {
          this.space_ids = value as List<int>;
        }
        break;

      case NAME:
        if (value == null) {
          unsetName();
        } else {
          this.name = value as Int8List;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case SPACE_IDS:
        return isSetSpace_ids();
      case NAME:
        return isSetName();
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
        case SPACE_IDS:
          if (field.type == TType.LIST) {
            {
              TList _list294 = iprot.readListBegin();
              this.space_ids = <int>[];
              for (int _i295 = 0; _i295 < _list294.length; ++_i295) {
                int _elem296;
                _elem296 = iprot.readI32();
                this.space_ids?.add(_elem296);
              }
              iprot.readListEnd();
            }
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case NAME:
          if (field.type == TType.STRING) {
            this.name = iprot.readBinary();
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
    if (this.space_ids != null) {
      oprot.writeFieldBegin(_SPACE_IDS_FIELD_DESC);
      {
        oprot.writeListBegin(new TList(TType.I32, this.space_ids?.length));
        for (var elem297 in this.space_ids ?? []) {
          oprot.writeI32(elem297);
        }
        oprot.writeListEnd();
      }
      oprot.writeFieldEnd();
    }
    if (this.name != null) {
      oprot.writeFieldBegin(_NAME_FIELD_DESC);
      oprot.writeBinary(this.name);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("CreateCPRequest(");

    ret.write("space_ids:");
    if (this.space_ids == null) {
      ret.write("null");
    } else {
      ret.write(this.space_ids);
    }

    ret.write(", ");
    ret.write("name:");
    if (this.name == null) {
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
