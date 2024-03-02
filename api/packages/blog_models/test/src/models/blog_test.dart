import 'package:blog_models/src/models/models.dart';
import 'package:test/test.dart';

void main() {
  group('Blog', () {
    test('can be instantiated', () {
      expect(blog, isNotNull);
    });

    test('supports value equality', () {
      expect(blog, equals(blog));
    });

    group('JSON Serialization', () {
      test('can be created from JSON', () {
        expect(Blog.fromJson(blogJson), isA<Blog>());
      });

      test('can be mapped to JSON', () {
        expect(blog.toJson(), equals(blogJson));
      });
    });
  });
}
