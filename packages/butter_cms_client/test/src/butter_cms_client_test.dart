// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes
import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../helpers/constants.dart';

class _MockApiClient extends Mock implements ApiClient {}

void main() {
  group('ButterCmsClient', () {
    final apiClient = _MockApiClient();
    final butterCmsClient = ButterCmsClient(apiClient: apiClient);
    test('can be instantiated', () {
      expect(butterCmsClient, isNotNull);
    });

    group('fetchBlogPosts', () {
      test(
          'returns BlogsRespones '
          'when the call completes successfully', () async {
        when(
          () => apiClient.get(
            path: any(named: 'path'),
            fromJson: BlogsResponse.fromJson,
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer(
          (_) async => BlogsResponse.fromJson(
            jsonDecode(rawJsonBlogsResponse) as Map<String, dynamic>,
          ),
        );

        expect(await butterCmsClient.fetchBlogPosts(), isA<BlogsResponse>());
      });

      test(
          'returns BlogsResponse without body '
          'when the call completes successfully '
          'and excludeBody is true', () async {
        when(
          () => apiClient.get(
            path: any(named: 'path'),
            fromJson: BlogsResponse.fromJson,
            queryParameters: any(
              named: 'queryParameters',
              that: contains('exclude_body'),
            ),
          ),
        ).thenAnswer(
          (_) async => BlogsResponse.fromJson(
            jsonDecode(rawJsonBlogsResponseExcludeBody) as Map<String, dynamic>,
          ),
        );

        final result = await butterCmsClient.fetchBlogPosts(excludeBody: true);
        expect(result.data.any((element) => element.body != null), isFalse);
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
