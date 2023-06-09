// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula.src.line_string;

import 'dart:typed_data' show Uint8List;
import 'package:fbthrift/fbthrift.dart';
import '../nebula.dart';

class LineString implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("LineString");
  static final TField _COORD_LIST_FIELD_DESC =
      new TField("coordList", TType.LIST, 1);

  List<Coordinate>? _coordList;
  static const int COORDLIST = 1;

  LineString() {}

  // coordList
  List<Coordinate>? get coordList => this._coordList;

  set coordList(List<Coordinate>? coordList) {
    this._coordList = coordList;
  }

  bool isSetCoordList() => this.coordList != null;

  unsetCoordList() {
    this.coordList = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case COORDLIST:
        return this.coordList;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object value) {
    switch (fieldID) {
      case COORDLIST:
        if (value == null) {
          unsetCoordList();
        } else {
          this.coordList = value as List<Coordinate>;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case COORDLIST:
        return isSetCoordList();
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
        case COORDLIST:
          if (field.type == TType.LIST) {
            {
              TList _list26 = iprot.readListBegin();
              this.coordList = <Coordinate>[];
              for (int _i27 = 0; _i27 < _list26.length; ++_i27) {
                Coordinate _elem28;
                _elem28 = new Coordinate();
                _elem28.read(iprot);
                this.coordList?.add(_elem28);
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
    if (this.coordList != null) {
      oprot.writeFieldBegin(_COORD_LIST_FIELD_DESC);
      {
        oprot.writeListBegin(new TList(TType.STRUCT, this.coordList?.length));
        for (var elem29 in this.coordList ?? []) {
          elem29.write(oprot);
        }
        oprot.writeListEnd();
      }
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("LineString(");

    ret.write("coordList:");
    if (this.coordList == null) {
      ret.write("null");
    } else {
      ret.write(this.coordList);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
