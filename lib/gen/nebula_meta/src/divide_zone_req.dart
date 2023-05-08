/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.divide_zone_req;

import 'dart:typed_data' show Int8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class DivideZoneReq implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("DivideZoneReq");
  static final TField _ZONE_NAME_FIELD_DESC =
      new TField("zone_name", TType.STRING, 1);
  static final TField _ZONE_ITEMS_FIELD_DESC =
      new TField("zone_items", TType.MAP, 2);

  Int8List? _zone_name;
  static const int ZONE_NAME = 1;
  Map<Int8List, List<t_nebula.HostAddr>>? _zone_items;
  static const int ZONE_ITEMS = 2;

  DivideZoneReq() {}

  // zone_name
  Int8List? get zone_name => this._zone_name;

  set zone_name(Int8List? zone_name) {
    this._zone_name = zone_name;
  }

  bool isSetZone_name() => this.zone_name != null;

  unsetZone_name() {
    this.zone_name = null;
  }

  // zone_items
  Map<Int8List, List<t_nebula.HostAddr>>? get zone_items => this._zone_items;

  set zone_items(Map<Int8List, List<t_nebula.HostAddr>>? zone_items) {
    this._zone_items = zone_items;
  }

  bool isSetZone_items() => this.zone_items != null;

  unsetZone_items() {
    this.zone_items = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case ZONE_NAME:
        return this.zone_name;
      case ZONE_ITEMS:
        return this.zone_items;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case ZONE_NAME:
        if (value == null) {
          unsetZone_name();
        } else {
          this.zone_name = value as Int8List?;
        }
        break;

      case ZONE_ITEMS:
        if (value == null) {
          unsetZone_items();
        } else {
          this.zone_items = value as Map<Int8List, List<t_nebula.HostAddr>>?;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case ZONE_NAME:
        return isSetZone_name();
      case ZONE_ITEMS:
        return isSetZone_items();
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
        case ZONE_NAME:
          if (field.type == TType.STRING) {
            this.zone_name = iprot.readBinary();
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case ZONE_ITEMS:
          if (field.type == TType.MAP) {
            {
              TMap _map232 = iprot.readMapBegin();
              this.zone_items = new Map<Int8List, List<t_nebula.HostAddr>>();
              for (int _i233 = 0; _i233 < _map232.length; ++_i233) {
                Int8List _key234;
                List<t_nebula.HostAddr> _val235;
                _key234 = iprot.readBinary();
                {
                  TList _list236 = iprot.readListBegin();
                  _val235 = <t_nebula.HostAddr>[];
                  for (int _i237 = 0; _i237 < _list236.length; ++_i237) {
                    t_nebula.HostAddr _elem238;
                    _elem238 = new t_nebula.HostAddr();
                    _elem238.read(iprot);
                    _val235.add(_elem238);
                  }
                  iprot.readListEnd();
                }
                this.zone_items?[_key234] = _val235;
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
    if (this.zone_name != null) {
      oprot.writeFieldBegin(_ZONE_NAME_FIELD_DESC);
      oprot.writeBinary(this.zone_name);
      oprot.writeFieldEnd();
    }
    if (this.zone_items != null) {
      oprot.writeFieldBegin(_ZONE_ITEMS_FIELD_DESC);
      {
        oprot.writeMapBegin(
            new TMap(TType.STRING, TType.LIST, this.zone_items?.length));
        for (var elem240 in this.zone_items?.keys ?? <Int8List>[]) {
          oprot.writeBinary(elem240);
          {
            oprot.writeListBegin(
                new TList(TType.STRUCT, this.zone_items?[elem240]?.length));
            for (var elem241
                in this.zone_items?[elem240] ?? <t_nebula.HostAddr>[]) {
              elem241.write(oprot);
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
    StringBuffer ret = new StringBuffer("DivideZoneReq(");

    ret.write("zone_name:");
    if (this.zone_name == null) {
      ret.write("null");
    } else {
      ret.write("BINARY");
    }

    ret.write(", ");
    ret.write("zone_items:");
    if (this.zone_items == null) {
      ret.write("null");
    } else {
      ret.write(this.zone_items);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
