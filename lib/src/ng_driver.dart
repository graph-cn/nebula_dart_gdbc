// Copyright (c) 2023- All nebula_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of "../nebula_dart_gdbc.dart";

class NgDriver extends Driver {
  @override
  bool acceptsURL(String url) {
    return url.startsWith('gdbc.nebula:');
  }

  @override
  Future<Connection> connect(
    String url, {
    Map<String, dynamic>? properties,
    Function()? onClose,
  }) async {
    var address = _parseURL(url);
    address.queryParameters.forEach((key, value) {
      properties![key] = value;
    });
    var conn = NgConnection._create(
      address,
      properties: properties,
      onClose: onClose,
    );
    await conn._open();
    return conn;
  }

  Uri _parseURL(String url) {
    var uri = Uri.parse(url);
    if (uri.scheme != 'gdbc.nebula' || uri.host.isEmpty || uri.port <= 0) {
      throw ArgumentError('Invalid URL: $url');
    }
    return uri;
  }
}
