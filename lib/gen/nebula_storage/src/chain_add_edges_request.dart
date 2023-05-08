// ignore_for_file: unnecessary_this, unnecessary_new, non_constant_identifier_names, annotate_overrides, no_leading_underscores_for_local_identifiers, constant_identifier_names, unused_import, import_of_legacy_library_into_null_safe, slash_for_doc_comments, empty_constructor_bodies, prefer_collection_literals

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_storage.src.chain_add_edges_request;

import 'dart:typed_data' show Int8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_storage/nebula_storage.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart'
    as t_nebula_meta;

class ChainAddEdgesRequest implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("ChainAddEdgesRequest");
  static final TField _SPACE_ID_FIELD_DESC =
      new TField("space_id", TType.I32, 1);
  static final TField _PARTS_FIELD_DESC = new TField("parts", TType.MAP, 2);
  static final TField _PROP_NAMES_FIELD_DESC =
      new TField("prop_names", TType.LIST, 3);
  static final TField _IF_NOT_EXISTS_FIELD_DESC =
      new TField("if_not_exists", TType.BOOL, 4);
  static final TField _TERM_FIELD_DESC = new TField("term", TType.I64, 5);
  static final TField _EDGE_VERSION_FIELD_DESC =
      new TField("edge_version", TType.I64, 6);

  int _space_id = 0;
  static const int SPACE_ID = 1;
  Map<int, List<NewEdge>>? _parts;
  static const int PARTS = 2;
  List<Int8List>? _prop_names;
  static const int PROP_NAMES = 3;
  bool _if_not_exists = false;
  static const int IF_NOT_EXISTS = 4;
  int _term = 0;
  static const int TERM = 5;
  int? _edge_version;
  static const int EDGE_VERSION = 6;

  bool __isset_space_id = false;
  bool __isset_if_not_exists = false;
  bool __isset_term = false;
  bool __isset_edge_version = false;

  ChainAddEdgesRequest() {}

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
  Map<int, List<NewEdge>>? get parts => this._parts;

  set parts(Map<int, List<NewEdge>>? parts) {
    this._parts = parts;
  }

  bool isSetParts() => this.parts != null;

  unsetParts() {
    this.parts = null;
  }

  // prop_names
  List<Int8List>? get prop_names => this._prop_names;

  set prop_names(List<Int8List>? prop_names) {
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

  // edge_version
  int? get edge_version => this._edge_version;

  set edge_version(int? edge_version) {
    this._edge_version = edge_version;
    this.__isset_edge_version = true;
  }

  bool isSetEdge_version() => this.__isset_edge_version;

  unsetEdge_version() {
    this.__isset_edge_version = false;
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
      case TERM:
        return this.term;
      case EDGE_VERSION:
        return this.edge_version;
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
          this.parts = value as Map<int, List<NewEdge>>?;
        }
        break;

      case PROP_NAMES:
        if (value == null) {
          unsetProp_names();
        } else {
          this.prop_names = value as List<Int8List>?;
        }
        break;

      case IF_NOT_EXISTS:
        if (value == null) {
          unsetIf_not_exists();
        } else {
          this.if_not_exists = value as bool;
        }
        break;

      case TERM:
        if (value == null) {
          unsetTerm();
        } else {
          this.term = value as int;
        }
        break;

      case EDGE_VERSION:
        if (value == null) {
          unsetEdge_version();
        } else {
          this.edge_version = value as int?;
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
      case TERM:
        return isSetTerm();
      case EDGE_VERSION:
        return isSetEdge_version();
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
              TMap _map328 = iprot.readMapBegin();
              this.parts = Map<int, List<NewEdge>>();
              for (int _i329 = 0; _i329 < _map328.length; ++_i329) {
                int _key330;
                List<NewEdge> _val331;
                _key330 = iprot.readI32();
                {
                  TList _list332 = iprot.readListBegin();
                  _val331 = <NewEdge>[];
                  for (int _i333 = 0; _i333 < _list332.length; ++_i333) {
                    NewEdge _elem334;
                    _elem334 = new NewEdge();
                    _elem334.read(iprot);
                    _val331.add(_elem334);
                  }
                  iprot.readListEnd();
                }
                this.parts?[_key330] = _val331;
              }
              iprot.readMapEnd();
            }
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case PROP_NAMES:
          if (field.type == TType.LIST) {
            {
              TList _list335 = iprot.readListBegin();
              this.prop_names = <Int8List>[];
              for (int _i336 = 0; _i336 < _list335.length; ++_i336) {
                Int8List _elem337;
                _elem337 = iprot.readBinary();
                this.prop_names?.add(_elem337);
              }
              iprot.readListEnd();
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
        case TERM:
          if (field.type == TType.I64) {
            this.term = iprot.readI64();
            this.__isset_term = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case EDGE_VERSION:
          if (field.type == TType.I64) {
            this.edge_version = iprot.readI64();
            this.__isset_edge_version = true;
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
        for (var elem339 in this.parts?.keys ?? <int>[]) {
          oprot.writeI32(elem339);
          {
            oprot.writeListBegin(
                new TList(TType.STRUCT, this.parts?[elem339]?.length));
            for (var elem340 in this.parts?[elem339] ?? <NewEdge>[]) {
              elem340.write(oprot);
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
        oprot.writeListBegin(new TList(TType.STRING, this.prop_names?.length));
        for (var elem341 in this.prop_names ?? <Int8List>[]) {
          oprot.writeBinary(elem341);
        }
        oprot.writeListEnd();
      }
      oprot.writeFieldEnd();
    }
    oprot.writeFieldBegin(_IF_NOT_EXISTS_FIELD_DESC);
    oprot.writeBool(this.if_not_exists);
    oprot.writeFieldEnd();
    oprot.writeFieldBegin(_TERM_FIELD_DESC);
    oprot.writeI64(this.term);
    oprot.writeFieldEnd();
    if (isSetEdge_version()) {
      oprot.writeFieldBegin(_EDGE_VERSION_FIELD_DESC);
      oprot.writeI64(this.edge_version);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("ChainAddEdgesRequest(");

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
    ret.write("term:");
    ret.write(this.term);

    if (isSetEdge_version()) {
      ret.write(", ");
      ret.write("edge_version:");
      ret.write(this.edge_version);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}