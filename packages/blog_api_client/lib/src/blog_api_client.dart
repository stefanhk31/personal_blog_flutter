import 'dart:io';

import 'package:http/http.dart';

/// {@template blog_api_client}
/// An implementation of an HTTP client to interact with the blog API.
/// {@endtemplate}
class BlogApiClient extends BaseClient {
  /// {@macro blog_api_client}
  BlogApiClient({required Client innerClient}) : _innerClient = innerClient;

  final Client _innerClient;

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers.putIfAbsent(
      HttpHeaders.contentTypeHeader,
      () => ContentType.json.value,
    );
    request.headers.putIfAbsent(
      HttpHeaders.acceptHeader,
      () => ContentType.json.value,
    );
    return _innerClient.send(request);
  }

  @override
  void close() {
    _innerClient.close();
    super.close();
  }
}
