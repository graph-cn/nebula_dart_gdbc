part of nebula_dart_gdbc;

extension Int8ListToString on Int8List {
  String utf8String() {
    return utf8.decode(Uint8List.fromList(this));
  }
}
