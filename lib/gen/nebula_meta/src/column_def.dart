// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.column_def;

import 'dart:typed_data' show Int8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class ColumnDef implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("ColumnDef");
  static final TField _NAME_FIELD_DESC = new TField("name", TType.STRING, 1);
  static final TField _TYPE_FIELD_DESC = new TField("type", TType.STRUCT, 2);
  static final TField _DEFAULT_VALUE_FIELD_DESC =
      new TField("default_value", TType.STRING, 3);
  static final TField _NULLABLE_FIELD_DESC =
      new TField("nullable", TType.BOOL, 4);
  static final TField _COMMENT_FIELD_DESC =
      new TField("comment", TType.STRING, 5);

  Int8List? _name;
  static const int NAME = 1;
  ColumnTypeDef? _type;
  static const int TYPE = 2;
  Int8List? _default_value;
  static const int DEFAULT_VALUE = 3;
  bool? _nullable;
  static const int NULLABLE = 4;
  Int8List? _comment;
  static const int COMMENT = 5;

  bool __isset_nullable = false;

  ColumnDef() {
    this.nullable = false;
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

  // type
  ColumnTypeDef? get type => this._type;

  set type(ColumnTypeDef? type) {
    this._type = type;
  }

  bool isSetType() => this.type != null;

  unsetType() {
    this.type = null;
  }

  // default_value
  Int8List? get default_value => this._default_value;

  set default_value(Int8List? default_value) {
    this._default_value = default_value;
  }

  bool isSetDefault_value() => this.default_value != null;

  unsetDefault_value() {
    this.default_value = null;
  }

  // nullable
  bool? get nullable => this._nullable;

  set nullable(bool? nullable) {
    this._nullable = nullable;
    this.__isset_nullable = true;
  }

  bool isSetNullable() => this.__isset_nullable;

  unsetNullable() {
    this.__isset_nullable = false;
  }

  // comment
  Int8List? get comment => this._comment;

  set comment(Int8List? comment) {
    this._comment = comment;
  }

  bool isSetComment() => this.comment != null;

  unsetComment() {
    this.comment = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case NAME:
        return this.name;
      case TYPE:
        return this.type;
      case DEFAULT_VALUE:
        return this.default_value;
      case NULLABLE:
        return this.nullable;
      case COMMENT:
        return this.comment;
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
          this.name = value as Int8List;
        }
        break;

      case TYPE:
        if (value == null) {
          unsetType();
        } else {
          this.type = value as ColumnTypeDef;
        }
        break;

      case DEFAULT_VALUE:
        if (value == null) {
          unsetDefault_value();
        } else {
          this.default_value = value as Int8List;
        }
        break;

      case NULLABLE:
        if (value == null) {
          unsetNullable();
        } else {
          this.nullable = value as bool;
        }
        break;

      case COMMENT:
        if (value == null) {
          unsetComment();
        } else {
          this.comment = value as Int8List;
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
      case TYPE:
        return isSetType();
      case DEFAULT_VALUE:
        return isSetDefault_value();
      case NULLABLE:
        return isSetNullable();
      case COMMENT:
        return isSetComment();
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
        case TYPE:
          if (field.type == TType.STRUCT) {
            this.type = new ColumnTypeDef();
            this.type?.read(iprot);
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case DEFAULT_VALUE:
          if (field.type == TType.STRING) {
            this.default_value = iprot.readBinary();
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case NULLABLE:
          if (field.type == TType.BOOL) {
            this.nullable = iprot.readBool();
            this.__isset_nullable = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case COMMENT:
          if (field.type == TType.STRING) {
            this.comment = iprot.readBinary();
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
    if (this.type != null) {
      oprot.writeFieldBegin(_TYPE_FIELD_DESC);
      this.type?.write(oprot);
      oprot.writeFieldEnd();
    }
    if (isSetDefault_value()) {
      if (this.default_value != null) {
        oprot.writeFieldBegin(_DEFAULT_VALUE_FIELD_DESC);
        oprot.writeBinary(this.default_value);
        oprot.writeFieldEnd();
      }
    }
    if (isSetNullable()) {
      oprot.writeFieldBegin(_NULLABLE_FIELD_DESC);
      oprot.writeBool(this.nullable);
      oprot.writeFieldEnd();
    }
    if (isSetComment()) {
      if (this.comment != null) {
        oprot.writeFieldBegin(_COMMENT_FIELD_DESC);
        oprot.writeBinary(this.comment);
        oprot.writeFieldEnd();
      }
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("ColumnDef(");

    ret.write("name:");
    if (this.name == null) {
      ret.write("null");
    } else {
      ret.write("BINARY");
    }

    ret.write(", ");
    ret.write("type:");
    if (this.type == null) {
      ret.write("null");
    } else {
      ret.write(this.type);
    }

    if (isSetDefault_value()) {
      ret.write(", ");
      ret.write("default_value:");
      if (this.default_value == null) {
        ret.write("null");
      } else {
        ret.write("BINARY");
      }
    }

    if (isSetNullable()) {
      ret.write(", ");
      ret.write("nullable:");
      ret.write(this.nullable);
    }

    if (isSetComment()) {
      ret.write(", ");
      ret.write("comment:");
      if (this.comment == null) {
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
    if (name == null) {
      throw new TProtocolError(TProtocolErrorType.UNKNOWN,
          "Required field 'name' was not present! Struct: " + toString());
    }
    if (type == null) {
      throw new TProtocolError(TProtocolErrorType.UNKNOWN,
          "Required field 'type' was not present! Struct: " + toString());
    }
    // check that fields of type enum have valid values
  }
}
