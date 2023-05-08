/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula.src.point;

import 'dart:typed_data' show Uint8List;
import 'package:fbthrift/fbthrift.dart';
import '../nebula.dart';

class Point implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("Point");
  static final TField _COORD_FIELD_DESC = new TField("coord", TType.STRUCT, 1);

  Coordinate? _coord;
  static const int COORD = 1;

  Point() {}

  // coord
  Coordinate? get coord => this._coord;

  set coord(Coordinate? coord) {
    this._coord = coord;
  }

  bool isSetCoord() => this.coord != null;

  unsetCoord() {
    this.coord = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case COORD:
        return this.coord;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object value) {
    switch (fieldID) {
      case COORD:
        if (value == null) {
          unsetCoord();
        } else {
          this.coord = value as Coordinate;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case COORD:
        return isSetCoord();
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
        case COORD:
          if (field.type == TType.STRUCT) {
            this.coord = new Coordinate();
            this.coord?.read(iprot);
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
    if (this.coord != null) {
      oprot.writeFieldBegin(_COORD_FIELD_DESC);
      this.coord?.write(oprot);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("Point(");

    ret.write("coord:");
    if (this.coord == null) {
      ret.write("null");
    } else {
      ret.write(this.coord);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
