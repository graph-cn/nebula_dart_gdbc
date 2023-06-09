// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_storage.src.add_vertices_request;

import 'dart:typed_data' show Int8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_storage/nebula_storage.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart'
    as t_nebula_meta;

class AddVerticesRequest implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("AddVerticesRequest");
  static final TField _SPACE_ID_FIELD_DESC =
      new TField("space_id", TType.I32, 1);
  static final TField _PARTS_FIELD_DESC = new TField("parts", TType.MAP, 2);
  static final TField _PROP_NAMES_FIELD_DESC =
      new TField("prop_names", TType.MAP, 3);
  static final TField _IF_NOT_EXISTS_FIELD_DESC =
      new TField("if_not_exists", TType.BOOL, 4);
  static final TField _IGNORE_EXISTED_INDEX_FIELD_DESC =
      new TField("ignore_existed_index", TType.BOOL, 5);
  static final TField _COMMON_FIELD_DESC =
      new TField("common", TType.STRUCT, 6);

  int _space_id = 0;
  static const int SPACE_ID = 1;
  Map<int, List<NewVertex>>? _parts;
  static const int PARTS = 2;
  Map<int, List<Int8List>>? _prop_names;
  static const int PROP_NAMES = 3;
  bool _if_not_exists = false;
  static const int IF_NOT_EXISTS = 4;
  bool _ignore_existed_index = false;
  static const int IGNORE_EXISTED_INDEX = 5;
  RequestCommon? _common;
  static const int COMMON = 6;

  bool __isset_space_id = false;
  bool __isset_if_not_exists = false;
  bool __isset_ignore_existed_index = false;

  AddVerticesRequest() {
    this.ignore_existed_index = false;
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

  // parts
  Map<int, List<NewVertex>>? get parts => this._parts;

  set parts(Map<int, List<NewVertex>>? parts) {
    this._parts = parts;
  }

  bool isSetParts() => this.parts != null;

  unsetParts() {
    this.parts = null;
  }

  // prop_names
  Map<int, List<Int8List>>? get prop_names => this._prop_names;

  set prop_names(Map<int, List<Int8List>>? prop_names) {
    this._prop_names = prop_names;
  }

  bool isSetProp_names() => this.prop_names != null;

  unsetProp_names() {
    this.prop_names = null;
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

  // ignore_existed_index
  bool get ignore_existed_index => this._ignore_existed_index;

  set ignore_existed_index(bool ignore_existed_index) {
    this._ignore_existed_index = ignore_existed_index;
    this.__isset_ignore_existed_index = true;
  }

  bool isSetIgnore_existed_index() => this.__isset_ignore_existed_index;

  unsetIgnore_existed_index() {
    this.__isset_ignore_existed_index = false;
  }

  // common
  RequestCommon? get common => this._common;

  set common(RequestCommon? common) {
    this._common = common;
  }

  bool isSetCommon() => this.common != null;

  unsetCommon() {
    this.common = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case SPACE_ID:
        return this.space_id;
      case PARTS:
        return this.parts;
      case PROP_NAMES:
        return this.prop_names;
      case IF_NOT_EXISTS:
        return this.if_not_exists;
      case IGNORE_EXISTED_INDEX:
        return this.ignore_existed_index;
      case COMMON:
        return this.common;
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

      case PARTS:
        if (value == null) {
          unsetParts();
        } else {
          this.parts = value as Map<int, List<NewVertex>>?;
        }
        break;

      case PROP_NAMES:
        if (value == null) {
          unsetProp_names();
        } else {
          this.prop_names = value as Map<int, List<Int8List>>?;
        }
        break;

      case IF_NOT_EXISTS:
        if (value == null) {
          unsetIf_not_exists();
        } else {
          this.if_not_exists = value as bool;
        }
        break;

      case IGNORE_EXISTED_INDEX:
        if (value == null) {
          unsetIgnore_existed_index();
        } else {
          this.ignore_existed_index = value as bool;
        }
        break;

      case COMMON:
        if (value == null) {
          unsetCommon();
        } else {
          this.common = value as RequestCommon?;
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
      case PARTS:
        return isSetParts();
      case PROP_NAMES:
        return isSetProp_names();
      case IF_NOT_EXISTS:
        return isSetIf_not_exists();
      case IGNORE_EXISTED_INDEX:
        return isSetIgnore_existed_index();
      case COMMON:
        return isSetCommon();
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
        case PARTS:
          if (field.type == TType.MAP) {
            {
              TMap _map108 = iprot.readMapBegin();
              this.parts = new Map<int, List<NewVertex>>();
              for (int _i109 = 0; _i109 < _map108.length; ++_i109) {
                int _key110;
                List<NewVertex> _val111;
                _key110 = iprot.readI32();
                {
                  TList _list112 = iprot.readListBegin();
                  _val111 = <NewVertex>[];
                  for (int _i113 = 0; _i113 < _list112.length; ++_i113) {
                    NewVertex _elem114;
                    _elem114 = new NewVertex();
                    _elem114.read(iprot);
                    _val111.add(_elem114);
                  }
                  iprot.readListEnd();
                }
                this.parts?[_key110] = _val111;
              }
              iprot.readMapEnd();
            }
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case PROP_NAMES:
          if (field.type == TType.MAP) {
            {
              TMap _map115 = iprot.readMapBegin();
              this.prop_names = new Map<int, List<Int8List>>();
              for (int _i116 = 0; _i116 < _map115.length; ++_i116) {
                int _key117;
                List<Int8List> _val118;
                _key117 = iprot.readI32();
                {
                  TList _list119 = iprot.readListBegin();
                  _val118 = <Int8List>[];
                  for (int _i120 = 0; _i120 < _list119.length; ++_i120) {
                    Int8List _elem121;
                    _elem121 = iprot.readBinary();
                    _val118.add(_elem121);
                  }
                  iprot.readListEnd();
                }
                this.prop_names?[_key117] = _val118;
              }
              iprot.readMapEnd();
            }
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
        case IGNORE_EXISTED_INDEX:
          if (field.type == TType.BOOL) {
            this.ignore_existed_index = iprot.readBool();
            this.__isset_ignore_existed_index = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case COMMON:
          if (field.type == TType.STRUCT) {
            this.common = new RequestCommon();
            this.common?.read(iprot);
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
    if (this.parts != null) {
      oprot.writeFieldBegin(_PARTS_FIELD_DESC);
      {
        oprot
            .writeMapBegin(new TMap(TType.I32, TType.LIST, this.parts?.length));
        for (var elem123 in this.parts?.keys ?? <int>[]) {
          oprot.writeI32(elem123);
          {
            oprot.writeListBegin(
                new TList(TType.STRUCT, this.parts?[elem123]?.length));
            for (var elem124 in this.parts?[elem123] ?? []) {
              elem124.write(oprot);
            }
            oprot.writeListEnd();
          }
        }
        oprot.writeMapEnd();
      }
      oprot.writeFieldEnd();
    }
    if (this.prop_names != null) {
      oprot.writeFieldBegin(_PROP_NAMES_FIELD_DESC);
      {
        oprot.writeMapBegin(
            new TMap(TType.I32, TType.LIST, this.prop_names?.length));
        for (var elem126 in this.prop_names?.keys ?? <int>[]) {
          oprot.writeI32(elem126);
          {
            oprot.writeListBegin(
                new TList(TType.STRING, this.prop_names?[elem126]?.length));
            for (var elem127 in this.prop_names?[elem126] ?? []) {
              oprot.writeBinary(elem127);
            }
            oprot.writeListEnd();
          }
        }
        oprot.writeMapEnd();
      }
      oprot.writeFieldEnd();
    }
    oprot.writeFieldBegin(_IF_NOT_EXISTS_FIELD_DESC);
    oprot.writeBool(this.if_not_exists);
    oprot.writeFieldEnd();
    oprot.writeFieldBegin(_IGNORE_EXISTED_INDEX_FIELD_DESC);
    oprot.writeBool(this.ignore_existed_index);
    oprot.writeFieldEnd();
    if (isSetCommon()) {
      if (this.common != null) {
        oprot.writeFieldBegin(_COMMON_FIELD_DESC);
        this.common?.write(oprot);
        oprot.writeFieldEnd();
      }
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("AddVerticesRequest(");

    ret.write("space_id:");
    ret.write(this.space_id);

    ret.write(", ");
    ret.write("parts:");
    if (this.parts == null) {
      ret.write("null");
    } else {
      ret.write(this.parts);
    }

    ret.write(", ");
    ret.write("prop_names:");
    if (this.prop_names == null) {
      ret.write("null");
    } else {
      ret.write(this.prop_names);
    }

    ret.write(", ");
    ret.write("if_not_exists:");
    ret.write(this.if_not_exists);

    ret.write(", ");
    ret.write("ignore_existed_index:");
    ret.write(this.ignore_existed_index);

    if (isSetCommon()) {
      ret.write(", ");
      ret.write("common:");
      if (this.common == null) {
        ret.write("null");
      } else {
        ret.write(this.common);
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
