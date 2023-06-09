// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.sign_in_service_req;

import 'dart:typed_data' show Uint8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class SignInServiceReq implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("SignInServiceReq");
  static final TField _TYPE_FIELD_DESC = new TField("type", TType.I32, 1);
  static final TField _CLIENTS_FIELD_DESC =
      new TField("clients", TType.LIST, 2);

  int? _type;
  static const int TYPE = 1;
  List<ServiceClient>? _clients;
  static const int CLIENTS = 2;

  bool __isset_type = false;

  SignInServiceReq() {}

  // type
  int? get type => this._type;

  set type(int? type) {
    this._type = type;
    this.__isset_type = true;
  }

  bool isSetType() => this.__isset_type;

  unsetType() {
    this.__isset_type = false;
  }

  // clients
  List<ServiceClient>? get clients => this._clients;

  set clients(List<ServiceClient>? clients) {
    this._clients = clients;
  }

  bool isSetClients() => this.clients != null;

  unsetClients() {
    this.clients = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case TYPE:
        return this.type;
      case CLIENTS:
        return this.clients;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case TYPE:
        if (value == null) {
          unsetType();
        } else {
          this.type = value as int;
        }
        break;

      case CLIENTS:
        if (value == null) {
          unsetClients();
        } else {
          this.clients = value as List<ServiceClient>;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case TYPE:
        return isSetType();
      case CLIENTS:
        return isSetClients();
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
        case TYPE:
          if (field.type == TType.I32) {
            this.type = iprot.readI32();
            this.__isset_type = true;
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case CLIENTS:
          if (field.type == TType.LIST) {
            {
              TList _list314 = iprot.readListBegin();
              this.clients = <ServiceClient>[];
              for (int _i315 = 0; _i315 < _list314.length; ++_i315) {
                ServiceClient _elem316;
                _elem316 = new ServiceClient();
                _elem316.read(iprot);
                this.clients?.add(_elem316);
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
    oprot.writeFieldBegin(_TYPE_FIELD_DESC);
    oprot.writeI32(this.type);
    oprot.writeFieldEnd();
    if (this.clients != null) {
      oprot.writeFieldBegin(_CLIENTS_FIELD_DESC);
      {
        oprot.writeListBegin(new TList(TType.STRUCT, this.clients?.length));
        for (var elem317 in this.clients ?? []) {
          elem317.write(oprot);
        }
        oprot.writeListEnd();
      }
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("SignInServiceReq(");

    ret.write("type:");
    String? type_name = ExternalServiceType.VALUES_TO_NAMES[this.type];
    if (type_name != null) {
      ret.write(type_name);
      ret.write(" (");
    }
    ret.write(this.type);
    if (type_name != null) {
      ret.write(")");
    }

    ret.write(", ");
    ret.write("clients:");
    if (this.clients == null) {
      ret.write("null");
    } else {
      ret.write(this.clients);
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
    if (isSetType() && !ExternalServiceType.VALID_VALUES.contains(type)) {
      throw new TProtocolError(TProtocolErrorType.UNKNOWN,
          "The field 'type' has been assigned the invalid value $type");
    }
  }
}
