// ignore_for_file: prefer_const_constructors

import 'package:blog_models/blog_models.dart';
import 'package:test/test.dart';

void main() {
  group('BlogsRequest', () {
    final blogsRequest = BlogsRequest(
      authorSlug: 'author_slug',
      categorySlug: 'category_slug',
      tagSlug: 'tag_slug',
    );

    test('can be instantiated', () {
      expect(blogsRequest, isNotNull);
    });

    test('supports value equality', () {
      expect(
        BlogsRequest(),
        equals(BlogsRequest()),
      );
    });

    group('JSON Serialization', () {
      final blogsRequestJson = {
        'offset': defaultRequestOffset.toString(),
        'limit': defaultRequestLimit.toString(),
        'exclude_body': true.toString(),
        'author_slug': 'author_slug',
        'category_slug': 'category_slug',
        'tag_slug': 'tag_slug',
      };
      test('can be created from JSON', () {
        expect(BlogsRequest.fromJson(blogsRequestJson), isA<BlogsRequest>());
      });

      test('can be mapped to JSON', () {
        expect(blogsRequest.toJson(), equals(blogsRequestJson));
      });
    });
  });
}
