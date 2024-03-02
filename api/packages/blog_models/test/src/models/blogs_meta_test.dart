import 'package:blog_models/src/models/models.dart';
import 'package:test/test.dart';

void main() {
  group('BlogsMeta', () {
    const blogsMeta = BlogsMeta(count: 1);

    test('can be instantiated', () {
      expect(blogsMeta, isNotNull);
    });

    test('supports value equality', () {
      expect(const BlogsMeta(count: 1), equals(const BlogsMeta(count: 1)));
    });

    group('JSON Serialization', () {
      final blogsMetaJson = {
        'count': 1,
        'next_page': null,
        'previous_page': null,
      };
      test('can be created from JSON', () {
        expect(BlogsMeta.fromJson(blogsMetaJson), isA<BlogsMeta>());
      });

      test('can be mapped to JSON', () {
        expect(blogsMeta.toJson(), equals(blogsMetaJson));
      });
    });
  });
}
