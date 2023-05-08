/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.reg_config_req;

import 'dart:typed_data' show Uint8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class RegConfigReq implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("RegConfigReq");
  static final TField _ITEMS_FIELD_DESC = new TField("items", TType.LIST, 1);

  List<ConfigItem>? _items;
  static const int ITEMS = 1;

  RegConfigReq() {}

  // items
  List<ConfigItem>? get items => this._items;

  set items(List<ConfigItem>? items) {
    this._items = items;
  }

  bool isSetItems() => this.items != null;

  unsetItems() {
    this.items = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case ITEMS:
        return this.items;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case ITEMS:
        if (value == null) {
          unsetItems();
        } else {
          this.items = value as List<ConfigItem>;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case ITEMS:
        return isSetItems();
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
        case ITEMS:
          if (field.type == TType.LIST) {
            {
              TList _list204 = iprot.readListBegin();
              this.items = <ConfigItem>[];
              for (int _i205 = 0; _i205 < _list204.length; ++_i205) {
                ConfigItem _elem206;
                _elem206 = new ConfigItem();
                _elem206.read(iprot);
                this.items?.add(_elem206);
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
    if (this.items != null) {
      oprot.writeFieldBegin(_ITEMS_FIELD_DESC);
      {
        oprot.writeListBegin(new TList(TType.STRUCT, this.items?.length));
        for (var elem207 in this.items ?? []) {
          elem207.write(oprot);
        }
        oprot.writeListEnd();
      }
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("RegConfigReq(");

    ret.write("items:");
    if (this.items == null) {
      ret.write("null");
    } else {
      ret.write(this.items);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
