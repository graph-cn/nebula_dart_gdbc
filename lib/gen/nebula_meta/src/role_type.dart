/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.role_type;

class RoleType {
  static const int GOD = 1;
  static const int ADMIN = 2;
  static const int DBA = 3;
  static const int USER = 4;
  static const int GUEST = 5;

  static final Set<int> VALID_VALUES = new Set.from([
    GOD
    , ADMIN
    , DBA
    , USER
    , GUEST
  ]);
  static final Map<int, String> VALUES_TO_NAMES = {
    GOD: 'GOD'
    , ADMIN: 'ADMIN'
    , DBA: 'DBA'
    , USER: 'USER'
    , GUEST: 'GUEST'
  };
}
