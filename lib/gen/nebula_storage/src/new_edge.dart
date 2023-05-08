// ignore_for_file: unnecessary_this, unnecessary_new, non_constant_identifier_names, annotate_overrides, no_leading_underscores_for_local_identifiers, constant_identifier_names, unused_import, import_of_legacy_library_into_null_safe, slash_for_doc_comments, empty_constructor_bodies

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_storage.src.new_edge;

import 'dart:typed_data' show Uint8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_storage/nebula_storage.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart'
    as t_nebula_meta;

class NewEdge implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("NewEdge");
  static final TField _KEY_FIELD_DESC = new TField("key", TType.STRUCT, 1);
  static final TField _PROPS_FIELD_DESC = new TField("props", TType.LIST, 2);

  EdgeKey? _key;
  static const int KEY = 1;
  List<t_nebula.Value>? _props;
  static const int PROPS = 2;

  NewEdge() {}

  // key
  EdgeKey? get key => this._key;

  set key(EdgeKey? key) {
    this._key = key;
  }

  bool isSetKey() => this.key != null;

  unsetKey() {
    this.key = null;
  }

  // props
  List<t_nebula.Value>? get props => this._props;

  set props(List<t_nebula.Value>? props) {
    this._props = props;
  }

  bool isSetProps() => this.props != null;

  unsetProps() {
    this.props = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case KEY:
        return this.key;
      case PROPS:
        return this.props;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case KEY:
        if (value == null) {
          unsetKey();
        } else {
          this.key = value as EdgeKey;
        }
        break;

      case PROPS:
        if (value == null) {
          unsetProps();
        } else {
          this.props = value as List<t_nebula.Value>;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case KEY:
        return isSetKey();
      case PROPS:
        return isSetProps();
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
        case KEY:
          if (field.type == TType.STRUCT) {
            this.key = new EdgeKey();
            this.key?.read(iprot);
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case PROPS:
          if (field.type == TType.LIST) {
            {
              TList _list104 = iprot.readListBegin();
              this.props = <t_nebula.Value>[];
              for (int _i105 = 0; _i105 < _list104.length; ++_i105) {
                t_nebula.Value _elem106;
                _elem106 = new t_nebula.Value();
                _elem106.read(iprot);
                this.props?.add(_elem106);
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
    if (this.key != null) {
      oprot.writeFieldBegin(_KEY_FIELD_DESC);
      this.key?.write(oprot);
      oprot.writeFieldEnd();
    }
    if (this.props != null) {
      oprot.writeFieldBegin(_PROPS_FIELD_DESC);
      {
        oprot.writeListBegin(new TList(TType.STRUCT, this.props?.length));
        for (var elem107 in this.props ?? []) {
          elem107.write(oprot);
        }
        oprot.writeListEnd();
      }
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("NewEdge(");

    ret.write("key:");
    if (this.key == null) {
      ret.write("null");
    } else {
      ret.write(this.key);
    }

    ret.write(", ");
    ret.write("props:");
    if (this.props == null) {
      ret.write("null");
    } else {
      ret.write(this.props);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
