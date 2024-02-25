import 'dart:async';
import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

Future<void> testMethodNotAllowed(
  RequestContext context,
  FutureOr<Response> Function() action,
  String method,
) async {
  final request = Request(method, Uri.parse('http://127.0.0.1/'));
  when(() => context.request).thenReturn(request);
  final response = await action();
  expect(response.statusCode, equals(HttpStatus.methodNotAllowed));
}
