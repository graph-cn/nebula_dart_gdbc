// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.change_password_req;

import 'dart:typed_data' show Int8List;
import 'package:fbthrift/fbthrift.dart';
import 'package:nebula_dart_gdbc/gen/nebula_meta/nebula_meta.dart';
import 'package:nebula_dart_gdbc/gen/nebula/nebula.dart' as t_nebula;

class ChangePasswordReq implements TBase {
  static final TStruct _STRUCT_DESC = new TStruct("ChangePasswordReq");
  static final TField _ACCOUNT_FIELD_DESC =
      new TField("account", TType.STRING, 1);
  static final TField _NEW_ENCODED_PWD_FIELD_DESC =
      new TField("new_encoded_pwd", TType.STRING, 2);
  static final TField _OLD_ENCODED_PWD_FIELD_DESC =
      new TField("old_encoded_pwd", TType.STRING, 3);

  Int8List? _account;
  static const int ACCOUNT = 1;
  Int8List? _new_encoded_pwd;
  static const int NEW_ENCODED_PWD = 2;
  Int8List? _old_encoded_pwd;
  static const int OLD_ENCODED_PWD = 3;

  ChangePasswordReq() {}

  // account
  Int8List? get account => this._account;

  set account(Int8List? account) {
    this._account = account;
  }

  bool isSetAccount() => this.account != null;

  unsetAccount() {
    this.account = null;
  }

  // new_encoded_pwd
  Int8List? get new_encoded_pwd => this._new_encoded_pwd;

  set new_encoded_pwd(Int8List? new_encoded_pwd) {
    this._new_encoded_pwd = new_encoded_pwd;
  }

  bool isSetNew_encoded_pwd() => this.new_encoded_pwd != null;

  unsetNew_encoded_pwd() {
    this.new_encoded_pwd = null;
  }

  // old_encoded_pwd
  Int8List? get old_encoded_pwd => this._old_encoded_pwd;

  set old_encoded_pwd(Int8List? old_encoded_pwd) {
    this._old_encoded_pwd = old_encoded_pwd;
  }

  bool isSetOld_encoded_pwd() => this.old_encoded_pwd != null;

  unsetOld_encoded_pwd() {
    this.old_encoded_pwd = null;
  }

  getFieldValue(int fieldID) {
    switch (fieldID) {
      case ACCOUNT:
        return this.account;
      case NEW_ENCODED_PWD:
        return this.new_encoded_pwd;
      case OLD_ENCODED_PWD:
        return this.old_encoded_pwd;
      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  setFieldValue(int fieldID, Object? value) {
    switch (fieldID) {
      case ACCOUNT:
        if (value == null) {
          unsetAccount();
        } else {
          this.account = value as Int8List?;
        }
        break;

      case NEW_ENCODED_PWD:
        if (value == null) {
          unsetNew_encoded_pwd();
        } else {
          this.new_encoded_pwd = value as Int8List?;
        }
        break;

      case OLD_ENCODED_PWD:
        if (value == null) {
          unsetOld_encoded_pwd();
        } else {
          this.old_encoded_pwd = value as Int8List?;
        }
        break;

      default:
        throw new ArgumentError("Field $fieldID doesn't exist!");
    }
  }

  // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
  bool isSet(int fieldID) {
    switch (fieldID) {
      case ACCOUNT:
        return isSetAccount();
      case NEW_ENCODED_PWD:
        return isSetNew_encoded_pwd();
      case OLD_ENCODED_PWD:
        return isSetOld_encoded_pwd();
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
        case ACCOUNT:
          if (field.type == TType.STRING) {
            this.account = iprot.readBinary();
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case NEW_ENCODED_PWD:
          if (field.type == TType.STRING) {
            this.new_encoded_pwd = iprot.readBinary();
          } else {
            TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case OLD_ENCODED_PWD:
          if (field.type == TType.STRING) {
            this.old_encoded_pwd = iprot.readBinary();
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
    if (this.account != null) {
      oprot.writeFieldBegin(_ACCOUNT_FIELD_DESC);
      oprot.writeBinary(this.account);
      oprot.writeFieldEnd();
    }
    if (this.new_encoded_pwd != null) {
      oprot.writeFieldBegin(_NEW_ENCODED_PWD_FIELD_DESC);
      oprot.writeBinary(this.new_encoded_pwd);
      oprot.writeFieldEnd();
    }
    if (this.old_encoded_pwd != null) {
      oprot.writeFieldBegin(_OLD_ENCODED_PWD_FIELD_DESC);
      oprot.writeBinary(this.old_encoded_pwd);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  String toString() {
    StringBuffer ret = new StringBuffer("ChangePasswordReq(");

    ret.write("account:");
    if (this.account == null) {
      ret.write("null");
    } else {
      ret.write("BINARY");
    }

    ret.write(", ");
    ret.write("new_encoded_pwd:");
    if (this.new_encoded_pwd == null) {
      ret.write("null");
    } else {
      ret.write("BINARY");
    }

    ret.write(", ");
    ret.write("old_encoded_pwd:");
    if (this.old_encoded_pwd == null) {
      ret.write("null");
    } else {
      ret.write("BINARY");
    }

    ret.write(")");

    return ret.toString();
  }

  validate() {
    // check for required fields
    // check that fields of type enum have valid values
  }
}
