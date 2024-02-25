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

    group('JSON Serialization', () {
      final blogMetaJson = {
        'next_post': null,
        'previous_post': null,
      };
      test('can be created from JSON', () {
        expect(BlogMeta.fromJson(blogMetaJson), isA<BlogMeta>());
      });

      test('can be mapped to JSON', () {
        expect(blogMeta.toJson(), equals(blogMetaJson));
      });
    });
  });
}