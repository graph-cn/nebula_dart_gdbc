// Copyright (c) 2023- All nebula_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../../nebula_dart_gdbc.dart";

extension Int8ListToString on Int8List {
  String utf8String() {
    return utf8.decode(Uint8List.fromList(this), allowMalformed: true);
  }
}
