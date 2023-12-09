// Copyright (c) 2023- All nebula_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../../nebula_dart_gdbc.dart";

extension StringExt on String {
  Int8List get bytes => Int8List.fromList(codeUnits);
  Int8List get utf8code => Int8List.fromList(utf8.encode(this));
}
