// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes
import 'dart:convert';
import 'dart:io';

import 'package:api_client/api_client.dart';
import 'package:blog_models/blog_models.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../helpers/constants.dart';

class _MockHttpClient extends Mock implements Client {}

void main() {
  group('ButterCmsClient', () {
    final httpClient = _MockHttpClient();
    const baseUrl = 'http://127.0.0.1';
    const apiKey = '12345';
    final butterCmsClient = ButterCmsClient(
      httpClient: httpClient,
      apiKey: apiKey,
      baseUrl: baseUrl,
    );

    test('can be instantiated', () {
      expect(butterCmsClient, isNotNull);
    });

    group('fetchBlogPosts', () {
      test(
          'returns 200 with json blog data '
          'when the call completes successfully', () async {
        when(
          () => httpClient.get(
            any(named: 'url', that: startsWith(baseUrl)),
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

      test(
          'returns BlogsResponse with json blog data minus body '
          'when the call completes successfully '
          'and excludeBody is true', () async {
        when(
          () => httpClient.get(
            any(named: 'url', that: startsWith(baseUrl)),
          ),
        ).thenAnswer(
          (_) async => Response(
            rawJsonBlogsResponseExcludeBody,
            HttpStatus.ok,
          ),
        );

        final result = await butterCmsClient.fetchBlogPosts(excludeBody: true);
        expect(result.statusCode, equals(HttpStatus.ok));
        expect(result.body, equals(rawJsonBlogsResponseExcludeBody));
      });

      test('throws exception when the call fails', () {
        when(
          () => apiClient.get(
            path: any(named: 'path'),
            fromJson: BlogsResponse.fromJson,
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenThrow(NotFound(body: 'body'));

        expect(() async => butterCmsClient.fetchBlogPosts(), throwsException);
      });
    });

    group('fetchBlogPost', () {
      const slug = 'blog-post-slug';
      test('returns Blog when the call completes successfully', () async {
        when(
          () => apiClient.get(
            path: any(named: 'path', that: contains(slug)),
            fromJson: BlogResponse.fromJson,
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer(
          (_) async => BlogResponse.fromJson(
            jsonDecode(rawJsonBlogResponse) as Map<String, dynamic>,
          ),
        );

        expect(
          await butterCmsClient.fetchBlogPost(slug: slug),
          isA<BlogResponse>(),
        );
      });

      test('throws exception when the call fails', () {
        when(
          () => apiClient.get(
            path: any(named: 'path', that: contains(slug)),
            fromJson: BlogResponse.fromJson,
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenThrow(NotFound(body: 'body'));

        expect(
          () async => butterCmsClient.fetchBlogPost(slug: slug),
          throwsException,
        );
      });
    });
  });
}
