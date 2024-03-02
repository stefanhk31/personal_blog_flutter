import 'dart:convert';
import 'dart:io';

import 'package:blog_api_client/blog_api_client.dart';
import 'package:blog_models/blog_models.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../helpers/fixtures.dart';

class _MockBlogApiClient extends Mock implements BlogApiClient {}

void main() {
  group('BlogApi', () {
    late BlogApiClient client;
    late BlogApi blogApi;
    const baseUrl = 'http://127.0.0.1';

    setUpAll(() {
      registerFallbackValue(Request('GET', Uri()));
    });

    setUp(() {
      client = _MockBlogApiClient();
      blogApi = BlogApi(
        client: client,
        baseUrl: baseUrl,
      );
    });

    test('can be instantiated', () {
      expect(blogApi, isNotNull);
    });

    group('getBlogs', () {
      final url = Uri.parse('$baseUrl/blogs');
      final response = BlogsResponse(
        meta: BlogsMeta(count: 1),
        data: [blog],
      );

      test('returns a blog response on a 200 response', () async {
        when(
          () => client.send(
            any(
              that: isA<Request>()
                  .having((req) => req.method, 'method', 'GET')
                  .having((req) => req.url, 'url', url),
            ),
          ),
        ).thenAnswer(
          (_) async => StreamedResponse(
            Stream.value(utf8.encode(jsonEncode(response))),
            HttpStatus.ok,
          ),
        );

        expect(
          await blogApi.getBlogs(),
          equals(response),
        );
      });
    });

    group('getBlog', () {});
  });
}
