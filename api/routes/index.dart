import 'package:dart_frog/dart_frog.dart';

/// Defaul request handler.
Response onRequest(RequestContext context) {
  return Response(body: 'Welcome to Dart Frog!');
}
