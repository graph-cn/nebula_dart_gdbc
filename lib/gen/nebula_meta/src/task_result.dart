// ignore_for_file: slash_for_doc_comments, unnecessary_new, non_constant_identifier_names, constant_identifier_names, unnecessary_this, empty_constructor_bodies, annotate_overrides, unnecessary_null_comparison, prefer_collection_literals, no_leading_underscores_for_local_identifiers, unused_import, unnecessary_import, prefer_interpolation_to_compose_strings, camel_case_types, prefer_generic_function_type_aliases, avoid_init_to_null, prefer_final_fields, unused_field

/**
 * Autogenerated by Thrift Compiler (0.18.1)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
library nebula_meta.src.task_result;

class TaskResult {
  static const int SUCCEEDED = 0;
  static const int FAILED = 1;
  static const int IN_PROGRESS = 2;
  static const int INVALID = 3;

  static final Set<int> VALID_VALUES =
      new Set.from([SUCCEEDED, FAILED, IN_PROGRESS, INVALID]);
  static final Map<int, String> VALUES_TO_NAMES = {
    SUCCEEDED: 'SUCCEEDED',
    FAILED: 'FAILED',
    IN_PROGRESS: 'IN_PROGRESS',
    INVALID: 'INVALID'
  };
}
