import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

/// Defaul request handler.
Response onRequest(RequestContext context) {
  final apiKey = Platform.environment['BUTTER_CMS_API_KEY'];
  return Response(body: 'Welcome to Dart Frog! $apiKey');
}
