// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula.src.row;

import 'dart:typed_data' show Uint8List;
import 'package:fbthrift/fbthrift.dart';
import '../nebula.dart';

class Row implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("Row");
  static final TField _VALUES_FIELD_DESC = new TField("values", TType.LIST, 1);

  List<Value>? _values;
  static const int VALUES = 1;

  Row() {}

  // values
  List<Value>? get values => this._values;

  set values(List<Value>? values) {
    this._values = values;
  }

  bool isSetValues() => this.values != null;

  unsetValues() {
    this.values = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case VALUES:
        return this.values;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object value) {
    switch (fieldID) {
      case VALUES:
        if (value == null) {
          unsetValues();
        } else {
          this.values = value as List<Value>;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case VALUES:
        return isSetValues();
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
        case VALUES:
          if (field.type == TType.LIST) {
            {
              TList _list14 = iprot.readListBegin();
              this.values = <Value>[];
              for (int _i15 = 0; _i15 < _list14.length; ++_i15) {
                Value _elem16;
                _elem16 = new Value();
                _elem16.read(iprot);
                this.values?.add(_elem16);
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
    if (this.values != null) {
      oprot.writeFieldBegin(_VALUES_FIELD_DESC);
      {
        oprot.writeListBegin(new TList(TType.STRUCT, this.values?.length));
        for (var elem17 in this.values ?? <Value>[]) {
          elem17.write(oprot);
        }
        oprot.writeListEnd();
      }
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("Row(");

    ret.write("values:");
    if (this.values == null) {
      ret.write("null");
    } else {
      ret.write(this.values);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
