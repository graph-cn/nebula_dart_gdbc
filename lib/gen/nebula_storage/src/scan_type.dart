/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_storage.src.scan_type;

class ScanType {
  static const int PREFIX = 1;
  static const int RANGE = 2;

  static final Set<int> VALID_VALUES = new Set.from([
    PREFIX
    , RANGE
  ]);
  static final Map<int, String> VALUES_TO_NAMES = {
    PREFIX: 'PREFIX'
    , RANGE: 'RANGE'
  };
}