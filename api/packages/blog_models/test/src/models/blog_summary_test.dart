import 'package:blog_models/src/models/models.dart';
import 'package:test/test.dart';

void main() {
  group('BlogSummary', () {
    final blogSummary = BlogSummary(
      slug: 'example-slug',
      title: 'Example Title',
      featuredImage: 'example-image.jpg',
    );

    test('can be instantiated', () {
      expect(blogSummary, isNotNull);
    });

    test('supports value equality', () {
      expect(blogSummary, equals(blogSummary));
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
