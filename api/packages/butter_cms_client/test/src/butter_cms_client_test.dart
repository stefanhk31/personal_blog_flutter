import 'dart:io';

import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../helpers/constants.dart';

class _MockHttpClient extends Mock implements Client {}

void main() {
  group('ButterCmsClient', () {
    late Client httpClient;
    late ButterCmsClient butterCmsClient;
    const baseUrl = '127.0.0.1';
    const apiKey = '12345';
    const errorMessage = 'error';

    setUpAll(() {
      registerFallbackValue(Uri());
    });

    setUp(() {
      httpClient = _MockHttpClient();
      butterCmsClient = ButterCmsClient(
        httpClient: httpClient,
        apiKey: apiKey,
        baseUrl: baseUrl,
      );
    });

    test('can be instantiated', () {
      expect(butterCmsClient, isNotNull);
    });

    group('fetchBlogPosts', () {
      const path = '/v2/posts';
      test(
          'returns 200 with json blog data '
          'when the call completes successfully', () async {
        when(
          () => httpClient.get(
            any(
              that: isA<Uri>().having(
                (uri) => uri.path,
                'path',
                path,
              ),
            ),
          ),
        ).thenAnswer(
          (_) async => Response(
            rawJsonBlogsResponse,
            200,
            headers: {'content-type': 'application/json'},
          ),
        );

        final result = await butterCmsClient.fetchBlogPosts();
        expect(result.statusCode, equals(HttpStatus.ok));
        expect(result.body, equals(rawJsonBlogsResponse));
      });

      test('returns failure with body when call fails', () async {
        when(
          () => httpClient.get(
            any(
              that: isA<Uri>().having(
                (uri) => uri.path,
                'path',
                path,
              ),
            ),
          ),
        ).thenAnswer(
          (_) async => Response(
            errorMessage,
            HttpStatus.notFound,
          ),
        );

        final result = await butterCmsClient.fetchBlogPosts();
        expect(result.statusCode, equals(HttpStatus.notFound));
        expect(result.body, equals(errorMessage));
      });
    });

    group('fetchBlogPost', () {
      const path = '/v2/posts/blog-post-slug';
      const slug = 'blog-post-slug';

      test(
          'returns 200 with json blog data '
          'when the call completes successfully', () async {
        when(
          () => httpClient.get(
            any(
              that: isA<Uri>().having(
                (uri) => uri.path,
                'path',
                path,
              ),
            ),
          ),
        ).thenAnswer(
          (_) async => Response(
            rawJsonBlogResponse,
            200,
            headers: {'content-type': 'application/json'},
          ),
        );

        final result = await butterCmsClient.fetchBlogPost(slug: slug);
        expect(result.statusCode, equals(HttpStatus.ok));
        expect(result.body, equals(rawJsonBlogResponse));
      });

      test('returns failure with body when call fails', () async {
        when(
          () => httpClient.get(
            any(
              that: isA<Uri>().having(
                (uri) => uri.path,
                'path',
                path,
              ),
            ),
          ),
        ).thenAnswer(
          (_) async => Response(
            errorMessage,
            HttpStatus.notFound,
          ),
        );

        final result = await butterCmsClient.fetchBlogPost(slug: slug);
        expect(result.statusCode, equals(HttpStatus.notFound));
        expect(result.body, equals(errorMessage));
      });
    });
  });
}
