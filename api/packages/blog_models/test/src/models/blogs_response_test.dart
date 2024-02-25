import 'package:blog_models/blog_models.dart';
import 'package:test/test.dart';

import '../../helpers/fixtures.dart';

void main() {
  group('BlogsResponse', () {
    final blogsResponse =
        BlogsResponse(meta: BlogsMeta(count: 1), data: [blog]);

    test('can be instantiated', () {
      expect(blogsResponse, isNotNull);
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
