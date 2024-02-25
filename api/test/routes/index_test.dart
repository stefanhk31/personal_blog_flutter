import 'dart:convert';
import 'dart:io';

import 'package:blog_models/blog_models.dart';
import 'package:blogs_data_source/blogs_data_source.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../routes/index.dart' as route;
import '../helpers/fixtures.dart';
import '../helpers/method_not_allowed.dart';

class _MockRequestContext extends Mock implements RequestContext {}

class _MockBlogsDataSource extends Mock implements BlogsDataSource {}

void main() {
  group('index', () {
    group('GET /', () {
      late BlogsDataSource dataSource;

      setUp(() {
        dataSource = _MockBlogsDataSource();
      });
      test('responds with a 200', () async {
        final context = _MockRequestContext();
        final request = Request('GET', Uri.parse('http://127.0.0.1/'));
        final blogsResponse =
            BlogsResponse(meta: BlogsMeta(count: 1), data: [blog]);
        when(() => context.request).thenReturn(request);
        when(() => context.read<BlogsDataSource>()).thenReturn(dataSource);
        when(() => dataSource.getBlogs())
            .thenAnswer((_) async => blogsResponse);
        final response = await route.onRequest(context);
        expect(response.statusCode, equals(HttpStatus.ok));
        expect(
          response.body(),
          completion(
            equals(jsonEncode(blogsResponse.toJson())),
          ),
        );
      });
    });

    test('returns 405 for unsupported methods', () async {
      final context = _MockRequestContext();
      Future<Response> action() async => route.onRequest(context);

      await testMethodNotAllowed(
        context,
        () => route.onRequest(context),
        'POST',
      );
      await testMethodNotAllowed(
        context,
        () => route.onRequest(context),
        'PUT',
      );
      await testMethodNotAllowed(
        context,
        () => route.onRequest(context),
        'DELETE',
      );
      await testMethodNotAllowed(
        context,
        action,
        'PATCH',
      );
      await testMethodNotAllowed(
        context,
        action,
        'HEAD',
      );
      await testMethodNotAllowed(
        context,
        action,
        'OPTIONS',
      );
    });
  });
}
