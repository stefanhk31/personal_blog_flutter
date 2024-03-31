// ignore_for_file: prefer_const_constructors

import 'package:blog_models/src/data_models/data_models.dart';
import 'package:test/test.dart';

void main() {
  group('BlogSummary', () {
    const blogSummary = BlogSummary(
      slug: 'example-slug',
      title: 'Example Title',
      featuredImage: 'example-image.jpg',
    );

    test('can be instantiated', () {
      expect(blogSummary, isNotNull);
    });

    test('supports value equality', () {
      expect(
        BlogSummary(
          slug: 'example-slug',
          title: 'Example Title',
          featuredImage: 'example-image.jpg',
        ),
        equals(
          BlogSummary(
            slug: 'example-slug',
            title: 'Example Title',
            featuredImage: 'example-image.jpg',
          ),
        ),
      );
    });

    group('JSON serialization', () {
      final blogSummaryJson = {
        'slug': 'example-slug',
        'title': 'Example Title',
        'featured_image': 'example-image.jpg',
      };

      test('can be created from JSON', () {
        expect(BlogSummary.fromJson(blogSummaryJson), isA<BlogSummary>());
      });

      test('can be mapped to JSON', () {
        expect(blogSummary.toJson(), equals(blogSummaryJson));
      });
    });
  });
}
