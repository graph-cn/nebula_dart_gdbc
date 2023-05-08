// ignore_for_file: unnecessary_this, unnecessary_new, non_constant_identifier_names, annotate_overrides, no_leading_underscores_for_local_identifiers, constant_identifier_names, unused_import, import_of_legacy_library_into_null_safe, slash_for_doc_comments, empty_constructor_bodies, prefer_collection_literals

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_storage.src.get_neighbors_request;

import 'dart:typed_data' show Int8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_storage/nebula_storage.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart'
    as t_nebula_meta;

class GetNeighborsRequest implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("GetNeighborsRequest");
  static final TField _SPACE_ID_FIELD_DESC =
      new TField("space_id", TType.I32, 1);
  static final TField _COLUMN_NAMES_FIELD_DESC =
      new TField("column_names", TType.LIST, 2);
  static final TField _PARTS_FIELD_DESC = new TField("parts", TType.MAP, 3);
  static final TField _TRAVERSE_SPEC_FIELD_DESC =
      new TField("traverse_spec", TType.STRUCT, 4);
  static final TField _COMMON_FIELD_DESC =
      new TField("common", TType.STRUCT, 5);

  int _space_id = 0;
  static const int SPACE_ID = 1;
  List<Int8List>? _column_names;
  static const int COLUMN_NAMES = 2;
  Map<int, List<t_nebula.Value>>? _parts;
  static const int PARTS = 3;
  TraverseSpec? _traverse_spec;
  static const int TRAVERSE_SPEC = 4;
  RequestCommon? _common;
  static const int COMMON = 5;

  bool __isset_space_id = false;

  GetNeighborsRequest() {}

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

  // column_names
  List<Int8List>? get column_names => this._column_names;

  set column_names(List<Int8List>? column_names) {
    this._column_names = column_names;
  }

  bool isSetColumn_names() => this.column_names != null;

  unsetColumn_names() {
    this.column_names = null;
  }

  // parts
  Map<int, List<t_nebula.Value>>? get parts => this._parts;

  set parts(Map<int, List<t_nebula.Value>>? parts) {
    this._parts = parts;
  }

  bool isSetParts() => this.parts != null;

  unsetParts() {
    this.parts = null;
  }

  // traverse_spec
  TraverseSpec? get traverse_spec => this._traverse_spec;

  set traverse_spec(TraverseSpec? traverse_spec) {
    this._traverse_spec = traverse_spec;
  }

  bool isSetTraverse_spec() => this.traverse_spec != null;

  unsetTraverse_spec() {
    this.traverse_spec = null;
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
      case COLUMN_NAMES:
        return this.column_names;
      case PARTS:
        return this.parts;
      case TRAVERSE_SPEC:
        return this.traverse_spec;
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

      case COLUMN_NAMES:
        if (value == null) {
          unsetColumn_names();
        } else {
          this.column_names = value as List<Int8List>?;
        }
        break;

      case PARTS:
        if (value == null) {
          unsetParts();
        } else {
          this.parts = value as Map<int, List<t_nebula.Value>>?;
        }
        break;

      case TRAVERSE_SPEC:
        if (value == null) {
          unsetTraverse_spec();
        } else {
          this.traverse_spec = value as TraverseSpec?;
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
      case COLUMN_NAMES:
        return isSetColumn_names();
      case PARTS:
        return isSetParts();
      case TRAVERSE_SPEC:
        return isSetTraverse_spec();
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
        case COLUMN_NAMES:
          if (field.type == TType.LIST) {
            {
              TList _list42 = iprot.readListBegin();
              this.column_names = <Int8List>[];
              for (int _i43 = 0; _i43 < _list42.length; ++_i43) {
                Int8List _elem44;
                _elem44 = iprot.readBinary();
                this.column_names?.add(_elem44);
              }
              iprot.readListEnd();
            }
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case PARTS:
          if (field.type == TType.MAP) {
            {
              TMap _map45 = iprot.readMapBegin();
              this.parts = new Map<int, List<t_nebula.Value>>();
              for (int _i46 = 0; _i46 < _map45.length; ++_i46) {
                int _key47;
                List<t_nebula.Value> _val48;
                _key47 = iprot.readI32();
                {
                  TList _list49 = iprot.readListBegin();
                  _val48 = <t_nebula.Value>[];
                  for (int _i50 = 0; _i50 < _list49.length; ++_i50) {
                    t_nebula.Value _elem51;
                    _elem51 = new t_nebula.Value();
                    _elem51.read(iprot);
                    _val48.add(_elem51);
                  }
                  iprot.readListEnd();
                }
                this.parts?[_key47] = _val48;
              }
              iprot.readMapEnd();
            }
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case TRAVERSE_SPEC:
          if (field.type == TType.STRUCT) {
            this.traverse_spec = new TraverseSpec();
            this.traverse_spec?.read(iprot);
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
    if (this.column_names != null) {
      oprot.writeFieldBegin(_COLUMN_NAMES_FIELD_DESC);
      {
        oprot
            .writeListBegin(new TList(TType.STRING, this.column_names?.length));
        for (var elem52 in this.column_names ?? []) {
          oprot.writeBinary(elem52);
        }
        oprot.writeListEnd();
      }
      oprot.writeFieldEnd();
    }
    if (this.parts != null) {
      oprot.writeFieldBegin(_PARTS_FIELD_DESC);
      {
        oprot
            .writeMapBegin(new TMap(TType.I32, TType.LIST, this.parts?.length));
        for (var elem54 in this.parts?.keys ?? <int>[]) {
          oprot.writeI32(elem54);
          {
            oprot.writeListBegin(
                new TList(TType.STRUCT, this.parts?[elem54]?.length));
            for (var elem55 in this.parts?[elem54] ?? <t_nebula.Value>[]) {
              elem55.write(oprot);
            }
            oprot.writeListEnd();
          }
        }
        oprot.writeMapEnd();
      }
      oprot.writeFieldEnd();
    }
    if (this.traverse_spec != null) {
      oprot.writeFieldBegin(_TRAVERSE_SPEC_FIELD_DESC);
      this.traverse_spec?.write(oprot);
      oprot.writeFieldEnd();
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
    StringBuffer ret = new StringBuffer("GetNeighborsRequest(");

    ret.write("space_id:");
    ret.write(this.space_id);

    ret.write(", ");
    ret.write("column_names:");
    if (this.column_names == null) {
      ret.write("null");
    } else {
      ret.write(this.column_names);
    }

    ret.write(", ");
    ret.write("parts:");
    if (this.parts == null) {
      ret.write("null");
    } else {
      ret.write(this.parts);
    }

    ret.write(", ");
    ret.write("traverse_spec:");
    if (this.traverse_spec == null) {
      ret.write("null");
    } else {
      ret.write(this.traverse_spec);
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
