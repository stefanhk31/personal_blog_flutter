// ignore_for_file: prefer_const_constructors

import 'package:blog_models/blog_models.dart';
import 'package:blog_repository/src/models/models.dart';
import 'package:test/test.dart';

void main() {
  group('BlogCategory', () {
    test('can be created from category', () {
      const category = Category(
        name: 'name',
        slug: 'slug',
      );

      final blogCategory = BlogCategory.fromApi(category);

      expect(blogCategory.name, equals(category.name));
      expect(blogCategory.slug, equals(category.slug));
    });

    test('supports value equality', () {
      final instance1 = BlogCategory(
        name: 'name',
        slug: 'slug',
      );

      final instance2 = BlogCategory(
        name: 'name',
        slug: 'slug',
      );

      expect(instance1, equals(instance2));
    });
  });
}
