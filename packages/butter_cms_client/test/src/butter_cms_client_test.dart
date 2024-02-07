// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes
import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockApiClient extends Mock implements ApiClient {}

void main() {
  group('ButterCmsClient', () {
    test('can be instantiated', () {
      expect(ButterCmsClient(apiClient: _MockApiClient()), isNotNull);
    });

    group('fetchBlogPosts', () {
      final apiClient = _MockApiClient();
      final butterCmsClient = ButterCmsClient(apiClient: apiClient);
      test('returns Blogs when the call completes successfully', () async {
        when(
          () => apiClient.get(
            path: any(named: 'path'),
            fromJson: Blogs.fromJson,
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenAnswer(
          (_) async => Blogs.fromJson(
            jsonDecode(rawJsonResponse) as Map<String, dynamic>,
          ),
        );

        expect(await butterCmsClient.fetchBlogPosts(), isA<Blogs>());
      });

      test('throws exception when the call fails', () {
        when(
          () => apiClient.get(
            path: any(named: 'path'),
            fromJson: Blogs.fromJson,
            queryParameters: any(named: 'queryParameters'),
          ),
        ).thenThrow(NotFound(body: 'body'));

        expect(() async => butterCmsClient.fetchBlogPosts(), throwsException);
      });
    });
  });
}

const rawJsonResponse = '''
{
  "meta": {
    "count": 1,
    "next_page": null,
    "previous_page": null
  },
  "data": [
    {
      "url": "http://www.example.com/blog/this-is-a-blog-post",
      "created": "2020-10-08T18:29:19.987936Z",
      "updated": "2020-10-09T15:49:54.580309Z",
      "published": "2020-10-08T18:08:00Z",
      "author": {
        "first_name": "API",
        "last_name": "Test",
        "email": "apitest@buttercms.com",
        "slug": "api-test",
        "bio": "This is my bio.",
        "title": "API",
        "linkedin_url": "https://www.linkedin.com/in/API",
        "facebook_url": "https://www.facebook.com/API",
        "twitter_handle": "buttercmsapi",
        "profile_image": "https://buttercms.com/api.png"
      },
      "categories": [
        {
          "name": "test category",
          "slug": "test-category"
        }
      ],
      "tags": [
        {
          "name": "test tag",
          "slug": "test-tag"
        }
      ],
      "featured_image": null,
      "featured_image_alt": "",
      "slug": "this-is-a-blog-post",
      "title": "This is a blog post",
      "body": "<p>This is a blog post to test the API.</p>",
      "summary": "This is a blog post to test the API.",
      "seo_title": "This is a blog post",
      "meta_description": "This is a blog post to test the API.",
      "status": "published"
    }
  ]
}
''';
