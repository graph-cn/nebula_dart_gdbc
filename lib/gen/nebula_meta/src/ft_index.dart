// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.ft_index;

import 'dart:typed_data' show Int8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class FTIndex implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("FTIndex");
  static final TField _SPACE_ID_FIELD_DESC =
      new TField("space_id", TType.I32, 1);
  static final TField _DEPEND_SCHEMA_FIELD_DESC =
      new TField("depend_schema", TType.STRUCT, 2);
  static final TField _FIELDS_FIELD_DESC = new TField("fields", TType.LIST, 3);

  int _space_id = 0;
  static const int SPACE_ID = 1;
  t_nebula.SchemaID? _depend_schema;
  static const int DEPEND_SCHEMA = 2;
  List<Int8List>? _fields;
  static const int FIELDS = 3;

  bool __isset_space_id = false;

  FTIndex() {}

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

  // depend_schema
  t_nebula.SchemaID? get depend_schema => this._depend_schema;

  set depend_schema(t_nebula.SchemaID? depend_schema) {
    this._depend_schema = depend_schema;
  }

  bool isSetDepend_schema() => this.depend_schema != null;

  unsetDepend_schema() {
    this.depend_schema = null;
  }

  // fields
  List<Int8List>? get fields => this._fields;

  set fields(List<Int8List>? fields) {
    this._fields = fields;
  }

  bool isSetFields() => this.fields != null;

  unsetFields() {
    this.fields = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case SPACE_ID:
        return this.space_id;
      case DEPEND_SCHEMA:
        return this.depend_schema;
      case FIELDS:
        return this.fields;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case SPACE_ID:
        if (value == null) {
          unsetSpace_id();
        } else {
          this.space_id = value as int;
        }
        break;

      case DEPEND_SCHEMA:
        if (value == null) {
          unsetDepend_schema();
        } else {
          this.depend_schema = value as t_nebula.SchemaID;
        }
        break;

      case FIELDS:
        if (value == null) {
          unsetFields();
        } else {
          this.fields = value as List<Int8List>;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case SPACE_ID:
        return isSetSpace_id();
      case DEPEND_SCHEMA:
        return isSetDepend_schema();
      case FIELDS:
        return isSetFields();
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
        case SPACE_ID:
          if (field.type == TType.I32) {
            this.space_id = iprot.readI32();
            this.__isset_space_id = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case DEPEND_SCHEMA:
          if (field.type == TType.STRUCT) {
            this.depend_schema = new t_nebula.SchemaID();
            this.depend_schema?.read(iprot);
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case FIELDS:
          if (field.type == TType.LIST) {
            {
              TList _list328 = iprot.readListBegin();
              this.fields = <Int8List>[];
              for (int _i329 = 0; _i329 < _list328.length; ++_i329) {
                Int8List _elem330;
                _elem330 = iprot.readBinary();
                this.fields?.add(_elem330);
              }
              iprot.readListEnd();
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
    oprot.writeFieldBegin(_SPACE_ID_FIELD_DESC);
    oprot.writeI32(this.space_id);
    oprot.writeFieldEnd();
    if (this.depend_schema != null) {
      oprot.writeFieldBegin(_DEPEND_SCHEMA_FIELD_DESC);
      this.depend_schema?.write(oprot);
      oprot.writeFieldEnd();
    }
    if (this.fields != null) {
      oprot.writeFieldBegin(_FIELDS_FIELD_DESC);
      {
        oprot.writeListBegin(new TList(TType.STRING, this.fields?.length));
        for (var elem331 in this.fields ?? []) {
          oprot.writeBinary(elem331);
        }
        oprot.writeListEnd();
      }
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("FTIndex(");

    ret.write("space_id:");
    ret.write(this.space_id);

    ret.write(", ");
    ret.write("depend_schema:");
    if (this.depend_schema == null) {
      ret.write("null");
    } else {
      ret.write(this.depend_schema);
    }

    ret.write(", ");
    ret.write("fields:");
    if (this.fields == null) {
      ret.write("null");
    } else {
      ret.write(this.fields);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
