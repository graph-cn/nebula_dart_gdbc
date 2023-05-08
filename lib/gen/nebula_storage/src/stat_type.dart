// ignore_for_file: unnecessary_this, unnecessary_new, non_constant_identifier_names, annotate_overrides, no_leading_underscores_for_local_identifiers, constant_identifier_names, unused_import, import_of_legacy_library_into_null_safe, slash_for_doc_comments, empty_constructor_bodies

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_storage.src.stat_type;

class StatType {
  static const int SUM = 1;
  static const int COUNT = 2;
  static const int AVG = 3;
  static const int MAX = 4;
  static const int MIN = 5;

  static final Set<int> VALID_VALUES =
      new Set.from([SUM, COUNT, AVG, MAX, MIN]);
  static final Map<int, String> VALUES_TO_NAMES = {
    SUM: 'SUM',
    COUNT: 'COUNT',
    AVG: 'AVG',
    MAX: 'MAX',
    MIN: 'MIN'
  };
}
