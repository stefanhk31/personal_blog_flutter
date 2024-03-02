import 'package:blog_models/blog_models.dart';
import 'package:test/test.dart';

void main() {
  group('BlogsResponse', () {
    final blogsResponse =
        BlogsResponse(meta: const BlogsMeta(count: 1), data: [blog]);

    test('can be instantiated', () {
      expect(blogsResponse, isNotNull);
    });

    test('supports value equality', () {
      expect(
        BlogsResponse(meta: const BlogsMeta(count: 1), data: [blog]),
        equals(blogsResponse),
      );
    });

    group('JSON Serialization', () {
      final blogsResponseJson = {
        'meta': {
          'count': 1,
          'next_page': null,
          'previous_page': null,
        },
        'data': [blogJson],
      };
      test('can be created from JSON', () {
        expect(BlogsResponse.fromJson(blogsResponseJson), isA<BlogsResponse>());
      });

      test('can be mapped to JSON', () {
        expect(blogsResponse.toJson(), equals(blogsResponseJson));
      });
    });
  });
}
