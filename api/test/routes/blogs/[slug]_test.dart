// ignore_for_file: avoid_relative_lib_imports

import 'dart:convert';
import 'dart:io';

import 'package:blog_models/blog_models.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../routes/blogs/[slug].dart' as route;
import '../../helpers/method_not_allowed.dart';

class _MockRequestContext extends Mock implements RequestContext {}

class _MockButterCmsClient extends Mock implements ButterCmsClient {}

void main() {
  group('[slug]', () {
    const slug = 'test-slug';
    group('GET /', () {
      late ButterCmsClient butterCmsClient;

      setUp(() {
        butterCmsClient = _MockButterCmsClient();
      });
      test('responds with a 200', () async {
        final context = _MockRequestContext();
        final request = Request('GET', Uri.parse('http://127.0.0.1/'));
        final blogResponse = BlogResponse(meta: const BlogMeta(), data: blog);
        when(() => context.request).thenReturn(request);
        when(() => context.read<ButterCmsClient>()).thenReturn(butterCmsClient);
        when(() => butterCmsClient.fetchBlogPost(slug: any(named: 'slug')))
            .thenAnswer(
          (_) async => http.Response(
            jsonEncode(blogResponse.toJson()),
            HttpStatus.ok,
          ),
        );
        final response = await route.onRequest(context, slug);
        expect(response.statusCode, equals(HttpStatus.ok));
        expect(
          response.body(),
          completion(
            equals(jsonEncode(blogResponse.toJson())),
          ),
        );
      });
    });

    test('returns 405 for unsupported methods', () async {
      final context = _MockRequestContext();
      Future<Response> action() async => route.onRequest(context, slug);

      await testMethodNotAllowed(
        context,
        () => route.onRequest(context, slug),
        'POST',
      );
      await testMethodNotAllowed(
        context,
        () => route.onRequest(context, slug),
        'PUT',
      );
      await testMethodNotAllowed(
        context,
        () => route.onRequest(context, slug),
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
