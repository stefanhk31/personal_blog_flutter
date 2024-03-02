// ignore_for_file: prefer_const_constructors

import 'package:blog_models/blog_models.dart';
import 'package:blog_repository/src/models/models.dart';
import 'package:test/test.dart';

void main() {
  group('BlogTag', () {
    test('can be created from tag', () {
      const tag = Tag(
        name: 'name',
        slug: 'slug',
      );

      final blogTag = BlogTag.fromApi(tag);

      expect(blogTag.name, equals(tag.name));
      expect(blogTag.slug, equals(tag.slug));
    });

    test('supports value equality', () {
      final instance1 = BlogTag(
        name: 'name',
        slug: 'slug',
      );

      final instance2 = BlogTag(
        name: 'name',
        slug: 'slug',
      );

      expect(instance1, equals(instance2));
    });
  });
}
