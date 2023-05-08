// ignore_for_file: unnecessary_this, unnecessary_new, non_constant_identifier_names, annotate_overrides, no_leading_underscores_for_local_identifiers, constant_identifier_names, unused_import, import_of_legacy_library_into_null_safe, slash_for_doc_comments

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_storage.src.update_edge_request;

import 'dart:typed_data' show Int8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_storage/nebula_storage.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart'
    as t_nebula_meta;

class UpdateEdgeRequest implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("UpdateEdgeRequest");
  static final TField _SPACE_ID_FIELD_DESC =
      new TField("space_id", TType.I32, 1);
  static final TField _PART_ID_FIELD_DESC = new TField("part_id", TType.I32, 2);
  static final TField _EDGE_KEY_FIELD_DESC =
      new TField("edge_key", TType.STRUCT, 3);
  static final TField _UPDATED_PROPS_FIELD_DESC =
      new TField("updated_props", TType.LIST, 4);
  static final TField _INSERTABLE_FIELD_DESC =
      new TField("insertable", TType.BOOL, 5);
  static final TField _RETURN_PROPS_FIELD_DESC =
      new TField("return_props", TType.LIST, 6);
  static final TField _CONDITION_FIELD_DESC =
      new TField("condition", TType.STRING, 7);
  static final TField _COMMON_FIELD_DESC =
      new TField("common", TType.STRUCT, 8);

  int _space_id = 0;
  static const int SPACE_ID = 1;
  int _part_id = 0;
  static const int PART_ID = 2;
  EdgeKey? _edge_key;
  static const int EDGE_KEY = 3;
  List<UpdatedProp>? _updated_props;
  static const int UPDATED_PROPS = 4;
  bool? _insertable;
  static const int INSERTABLE = 5;
  List<Int8List>? _return_props;
  static const int RETURN_PROPS = 6;
  Int8List? _condition;
  static const int CONDITION = 7;
  RequestCommon? _common;
  static const int COMMON = 8;

  bool __isset_space_id = false;
  bool __isset_part_id = false;
  bool __isset_insertable = false;

  UpdateEdgeRequest() {
    this.insertable = false;
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

  // edge_key
  EdgeKey? get edge_key => this._edge_key;

  set edge_key(EdgeKey? edge_key) {
    this._edge_key = edge_key;
  }

  bool isSetEdge_key() => this.edge_key != null;

  unsetEdge_key() {
    this.edge_key = null;
  }

  // updated_props
  List<UpdatedProp>? get updated_props => this._updated_props;

  set updated_props(List<UpdatedProp>? updated_props) {
    this._updated_props = updated_props;
  }

  bool isSetUpdated_props() => this.updated_props != null;

  unsetUpdated_props() {
    this.updated_props = null;
  }

  // insertable
  bool? get insertable => this._insertable;

  set insertable(bool? insertable) {
    this._insertable = insertable;
    this.__isset_insertable = true;
  }

  bool isSetInsertable() => this.__isset_insertable;

  unsetInsertable() {
    this.__isset_insertable = false;
  }

  // return_props
  List<Int8List>? get return_props => this._return_props;

  set return_props(List<Int8List>? return_props) {
    this._return_props = return_props;
  }

  bool isSetReturn_props() => this.return_props != null;

  unsetReturn_props() {
    this.return_props = null;
  }

  // condition
  Int8List? get condition => this._condition;

  set condition(Int8List? condition) {
    this._condition = condition;
  }

  bool isSetCondition() => this.condition != null;

  unsetCondition() {
    this.condition = null;
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
      case PART_ID:
        return this.part_id;
      case EDGE_KEY:
        return this.edge_key;
      case UPDATED_PROPS:
        return this.updated_props;
      case INSERTABLE:
        return this.insertable;
      case RETURN_PROPS:
        return this.return_props;
      case CONDITION:
        return this.condition;
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

      case PART_ID:
        if (value == null) {
          unsetPart_id();
        } else {
          this.part_id = value as int;
        }
        break;

      case EDGE_KEY:
        if (value == null) {
          unsetEdge_key();
        } else {
          this.edge_key = value as EdgeKey?;
        }
        break;

      case UPDATED_PROPS:
        if (value == null) {
          unsetUpdated_props();
        } else {
          this.updated_props = value as List<UpdatedProp>?;
        }
        break;

      case INSERTABLE:
        if (value == null) {
          unsetInsertable();
        } else {
          this.insertable = value as bool?;
        }
        break;

      case RETURN_PROPS:
        if (value == null) {
          unsetReturn_props();
        } else {
          this.return_props = value as List<Int8List>?;
        }
        break;

      case CONDITION:
        if (value == null) {
          unsetCondition();
        } else {
          this.condition = value as Int8List?;
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
      case PART_ID:
        return isSetPart_id();
      case EDGE_KEY:
        return isSetEdge_key();
      case UPDATED_PROPS:
        return isSetUpdated_props();
      case INSERTABLE:
        return isSetInsertable();
      case RETURN_PROPS:
        return isSetReturn_props();
      case CONDITION:
        return isSetCondition();
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
        case PART_ID:
          if (field.type == TType.I32) {
            this.part_id = iprot.readI32();
            this.__isset_part_id = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case EDGE_KEY:
          if (field.type == TType.STRUCT) {
            this.edge_key = new EdgeKey();
            this.edge_key?.read(iprot);
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case UPDATED_PROPS:
          if (field.type == TType.LIST) {
            {
              TList _list184 = iprot.readListBegin();
              this.updated_props = <UpdatedProp>[];
              for (int _i185 = 0; _i185 < _list184.length; ++_i185) {
                UpdatedProp _elem186;
                _elem186 = new UpdatedProp();
                _elem186.read(iprot);
                this.updated_props?.add(_elem186);
              }
              iprot.readListEnd();
            }
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case INSERTABLE:
          if (field.type == TType.BOOL) {
            this.insertable = iprot.readBool();
            this.__isset_insertable = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case RETURN_PROPS:
          if (field.type == TType.LIST) {
            {
              TList _list187 = iprot.readListBegin();
              this.return_props = <Int8List>[];
              for (int _i188 = 0; _i188 < _list187.length; ++_i188) {
                Int8List _elem189;
                _elem189 = iprot.readBinary();
                this.return_props?.add(_elem189);
              }
              iprot.readListEnd();
            }
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case CONDITION:
          if (field.type == TType.STRING) {
            this.condition = iprot.readBinary();
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
    oprot.writeFieldBegin(_PART_ID_FIELD_DESC);
    oprot.writeI32(this.part_id);
    oprot.writeFieldEnd();
    if (this.edge_key != null) {
      oprot.writeFieldBegin(_EDGE_KEY_FIELD_DESC);
      this.edge_key?.write(oprot);
      oprot.writeFieldEnd();
    }
    if (this.updated_props != null) {
      oprot.writeFieldBegin(_UPDATED_PROPS_FIELD_DESC);
      {
        oprot.writeListBegin(
            new TList(TType.STRUCT, this.updated_props?.length));
        for (var elem190 in this.updated_props ?? []) {
          elem190.write(oprot);
        }
        oprot.writeListEnd();
      }
      oprot.writeFieldEnd();
    }
    if (isSetInsertable()) {
      oprot.writeFieldBegin(_INSERTABLE_FIELD_DESC);
      oprot.writeBool(this.insertable);
      oprot.writeFieldEnd();
    }
    if (isSetReturn_props()) {
      if (this.return_props != null) {
        oprot.writeFieldBegin(_RETURN_PROPS_FIELD_DESC);
        {
          oprot.writeListBegin(
              new TList(TType.STRING, this.return_props?.length));
          for (var elem191 in this.return_props ?? []) {
            oprot.writeBinary(elem191);
          }
          oprot.writeListEnd();
        }
        oprot.writeFieldEnd();
      }
    }
    if (isSetCondition()) {
      if (this.condition != null) {
        oprot.writeFieldBegin(_CONDITION_FIELD_DESC);
        oprot.writeBinary(this.condition);
        oprot.writeFieldEnd();
      }
    }
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
    StringBuffer ret = new StringBuffer("UpdateEdgeRequest(");

    ret.write("space_id:");
    ret.write(this.space_id);

    ret.write(", ");
    ret.write("part_id:");
    ret.write(this.part_id);

    ret.write(", ");
    ret.write("edge_key:");
    if (this.edge_key == null) {
      ret.write("null");
    } else {
      ret.write(this.edge_key);
    }

    ret.write(", ");
    ret.write("updated_props:");
    if (this.updated_props == null) {
      ret.write("null");
    } else {
      ret.write(this.updated_props);
    }

    if (isSetInsertable()) {
      ret.write(", ");
      ret.write("insertable:");
      ret.write(this.insertable);
    }

    if (isSetReturn_props()) {
      ret.write(", ");
      ret.write("return_props:");
      if (this.return_props == null) {
        ret.write("null");
      } else {
        ret.write(this.return_props);
      }
    }

    if (isSetCondition()) {
      ret.write(", ");
      ret.write("condition:");
      if (this.condition == null) {
        ret.write("null");
      } else {
        ret.write("BINARY");
      }
    }

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
