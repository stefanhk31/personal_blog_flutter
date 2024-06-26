// ignore_for_file: prefer_const_constructors

import 'package:blog_models/blog_models.dart';
import 'package:test/test.dart';

void main() {
  group('BlogsRequest', () {
    final blogsRequest = BlogsRequest();

    test('can be instantiated', () {
      expect(blogsRequest, isNotNull);
    });

    test('supports value equality', () {
      expect(
        BlogsRequest(),
        equals(blogsRequest),
      );
    });

    group('JSON Serialization', () {
      final blogsRequestJson = {
        'offset': defaultRequestOffset,
        'limit': defaultRequestLimit,
        'exclude_body': true,
        'author_slug': null,
        'category_slug': null,
        'tag_slug': null,
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
