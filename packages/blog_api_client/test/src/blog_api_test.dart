import 'dart:convert';
import 'dart:io';

import 'package:blog_api_client/blog_api_client.dart';
import 'package:blog_models/blog_models.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

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

      test('throws BlogApiMalformedResponse when body is malformed', () async {
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
            Stream.value(utf8.encode('')),
            HttpStatus.ok,
          ),
        );

        expect(
          () async => blogApi.getBlogs(),
          throwsA(isA<BlogApiClientMalformedResponse>()),
        );
      });

      test(
        'throws BlogApiClientFailure when response is not successful',
        () {
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
              Stream.value(utf8.encode(jsonEncode({}))),
              HttpStatus.internalServerError,
            ),
          );

          expect(
            () async => blogApi.getBlogs(),
            throwsA(
              isA<BlogApiClientFailure>()
                  .having(
                (f) => f.statusCode,
                'statusCode',
                HttpStatus.internalServerError,
              )
                  .having(
                (f) => f.body,
                'body',
                {'error': <String, dynamic>{}},
              ),
            ),
          );
        },
      );

      test(
          'throws BlogApiClientFailure with a 500 '
          'when an unexpected exception occurs', () async {
        final exception = Exception('unexpected exception');
        when(
          () => client.send(
            any(
              that: isA<Request>()
                  .having((req) => req.method, 'method', 'GET')
                  .having((req) => req.url, 'url', url),
            ),
          ),
        ).thenThrow(exception);

        expect(
          () async => blogApi.getBlogs(),
          throwsA(
            isA<BlogApiClientFailure>()
                .having(
              (f) => f.statusCode,
              'statusCode',
              HttpStatus.internalServerError,
            )
                .having((f) => f.body, 'body', {
              'error': exception,
            }),
          ),
        );
      });
    });

    group('getBlog', () {
      const slug = 'example-slug';
      final url = Uri.parse('$baseUrl/blogs/$slug');
      final response = BlogResponse(meta: const BlogMeta(), data: blog);

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
          await blogApi.getBlog(slug),
          equals(response),
        );
      });

      test('throws BlogApiMalformedResponse when body is malformed', () async {
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
            Stream.value(utf8.encode('')),
            HttpStatus.ok,
          ),
        );

        expect(
          () async => blogApi.getBlog(slug),
          throwsA(isA<BlogApiClientMalformedResponse>()),
        );
      });

      test(
        'throws BlogApiClientFailure when response is not successful',
        () {
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
              Stream.value(utf8.encode(jsonEncode({}))),
              HttpStatus.internalServerError,
            ),
          );

          expect(
            () async => blogApi.getBlog(slug),
            throwsA(
              isA<BlogApiClientFailure>()
                  .having(
                (f) => f.statusCode,
                'statusCode',
                HttpStatus.internalServerError,
              )
                  .having(
                (f) => f.body,
                'body',
                {'error': <String, dynamic>{}},
              ),
            ),
          );
        },
      );

      test(
          'throws BlogApiClientFailure with a 500 '
          'when an unexpected exception occurs', () async {
        final exception = Exception('unexpected exception');
        when(
          () => client.send(
            any(
              that: isA<Request>()
                  .having((req) => req.method, 'method', 'GET')
                  .having((req) => req.url, 'url', url),
            ),
          ),
        ).thenThrow(exception);

        expect(
          () async => blogApi.getBlog(slug),
          throwsA(
            isA<BlogApiClientFailure>()
                .having(
              (f) => f.statusCode,
              'statusCode',
              HttpStatus.internalServerError,
            )
                .having((f) => f.body, 'body', {
              'error': exception,
            }),
          ),
        );
      });
    });
  });
}
