/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.query_status;

class QueryStatus {
  static const int RUNNING = 1;
  static const int KILLING = 2;

  static final Set<int> VALID_VALUES = new Set.from([
    RUNNING
    , KILLING
  ]);
  static final Map<int, String> VALUES_TO_NAMES = {
    RUNNING: 'RUNNING'
    , KILLING: 'KILLING'
  };
}
