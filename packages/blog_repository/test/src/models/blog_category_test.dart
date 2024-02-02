import 'package:blog_repository/src/models/models.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:test/test.dart';

void main() {
  group('BlogCategory', () {
    test('can be created from category', () {
      const category = Category(
        name: 'name',
        slug: 'slug',
      );

      final blogCategory = BlogCategory.fromButter(category);

      expect(blogCategory.name, equals(category.name));
      expect(blogCategory.slug, equals(category.slug));
    });

    test('supports value equality', () {
      const instance1 = BlogCategory(
        name: 'name',
        slug: 'slug',
      );

      const instance2 = BlogCategory(
        name: 'name',
        slug: 'slug',
      );

      expect(instance1, equals(instance2));
    });
  });
}
