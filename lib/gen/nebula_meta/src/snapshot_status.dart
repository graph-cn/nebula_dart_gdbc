/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.snapshot_status;

class SnapshotStatus {
  static const int VALID = 0;
  static const int INVALID = 1;

  static final Set<int> VALID_VALUES = new Set.from([
    VALID
    , INVALID
  ]);
  static final Map<int, String> VALUES_TO_NAMES = {
    VALID: 'VALID'
    , INVALID: 'INVALID'
  };
}
