/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.listener_type;

class ListenerType {
  static const int UNKNOWN = 0;
  static const int ELASTICSEARCH = 1;

  static final Set<int> VALID_VALUES = new Set.from([
    UNKNOWN
    , ELASTICSEARCH
  ]);
  static final Map<int, String> VALUES_TO_NAMES = {
    UNKNOWN: 'UNKNOWN'
    , ELASTICSEARCH: 'ELASTICSEARCH'
  };
}
