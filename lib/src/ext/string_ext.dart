part of nebula_dart_gdbc;

extension StringExt on String {
  Int8List get bytes => Int8List.fromList(codeUnits);
  Int8List get utf8code => Int8List.fromList(utf8.encode(this));
}
