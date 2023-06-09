// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_storage.src.kv_put_request;

import 'dart:typed_data' show Uint8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_storage/nebula_storage.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart'
    as t_nebula_meta;

class KVPutRequest implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("KVPutRequest");
  static final TField _SPACE_ID_FIELD_DESC =
      new TField("space_id", TType.I32, 1);
  static final TField _PARTS_FIELD_DESC = new TField("parts", TType.MAP, 2);

  int _space_id = 0;
  static const int SPACE_ID = 1;
  Map<int, List<t_nebula.KeyValue>>? _parts;
  static const int PARTS = 2;

  bool __isset_space_id = false;

  KVPutRequest() {}

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
  Map<int, List<t_nebula.KeyValue>>? get parts => this._parts;

  set parts(Map<int, List<t_nebula.KeyValue>>? parts) {
    this._parts = parts;
  }

  bool isSetParts() => this.parts != null;

  unsetParts() {
    this.parts = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case SPACE_ID:
        return this.space_id;
      case PARTS:
        return this.parts;
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
          this.parts = value as Map<int, List<t_nebula.KeyValue>>;
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
              TMap _map270 = iprot.readMapBegin();
              this.parts = <int, List<t_nebula.KeyValue>>{};
              for (int _i271 = 0; _i271 < _map270.length; ++_i271) {
                int _key272;
                List<t_nebula.KeyValue> _val273;
                _key272 = iprot.readI32();
                {
                  TList _list274 = iprot.readListBegin();
                  _val273 = <t_nebula.KeyValue>[];
                  for (int _i275 = 0; _i275 < _list274.length; ++_i275) {
                    t_nebula.KeyValue _elem276;
                    _elem276 = new t_nebula.KeyValue();
                    _elem276.read(iprot);
                    _val273.add(_elem276);
                  }
                  iprot.readListEnd();
                }
                this.parts?[_key272] = _val273;
              }
              iprot.readMapEnd();
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
    if (this.parts != null) {
      oprot.writeFieldBegin(_PARTS_FIELD_DESC);
      {
        oprot
            .writeMapBegin(new TMap(TType.I32, TType.LIST, this.parts?.length));
        for (var elem278 in this.parts?.keys ?? <int>[]) {
          oprot.writeI32(elem278);
          {
            oprot.writeListBegin(
                new TList(TType.STRUCT, this.parts?[elem278]?.length));
            for (var elem279 in this.parts?[elem278] ?? <t_nebula.KeyValue>[]) {
              elem279.write(oprot);
            }
            oprot.writeListEnd();
          }
        }
        oprot.writeMapEnd();
      }
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("KVPutRequest(");

    ret.write("space_id:");
    ret.write(this.space_id);

    ret.write(", ");
    ret.write("parts:");
    if (this.parts == null) {
      ret.write("null");
    } else {
      ret.write(this.parts);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
