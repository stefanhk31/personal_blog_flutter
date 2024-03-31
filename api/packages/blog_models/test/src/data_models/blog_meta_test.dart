// ignore_for_file: prefer_const_constructors

import 'package:blog_models/blog_models.dart';
import 'package:test/test.dart';

void main() {
  group('BlogMeta', () {
    const blogMeta = BlogMeta();
    test('can be instantiated', () {
      expect(
        blogMeta,
        isNotNull,
      );
    });

    test('supports value equality', () {
      expect(BlogMeta(), equals(BlogMeta()));
    });

    group('JSON Serialization', () {
      final blogMetaJson = {
        'next_post': blogSummaryJson,
        'previous_post': blogSummaryJson,
      };

      final emptyBlogMetaJson = {
        'next_post': null,
        'previous_post': null,
      };

      test('can be created from JSON with blog summaries', () {
        expect(BlogMeta.fromJson(blogMetaJson), isA<BlogMeta>());
      });

      test('can be created from JSON with empty blog summaries', () {
        expect(BlogMeta.fromJson(emptyBlogMetaJson), isA<BlogMeta>());
      });

      test('can be mapped to JSON with blog summaries', () {
        expect(
          BlogMeta(
            previousPost: blogSummary,
            nextPost: blogSummary,
          ).toJson(),
          equals(blogMetaJson),
        );
      });

      test('can be mapped to JSON with empty blog summaries', () {
        expect(blogMeta.toJson(), equals(emptyBlogMetaJson));
      });
    });
  });
}
