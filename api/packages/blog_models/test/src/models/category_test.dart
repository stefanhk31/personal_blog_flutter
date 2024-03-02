import 'package:blog_models/blog_models.dart';
import 'package:test/test.dart';

void main() {
  group('Category', () {
    test('can be instantiated', () {
      expect(category, isNotNull);
    });

    test('supports value equality', () {
      expect(const Category(name: 'name', slug: 'slug'), equals(category));
    });

    group('JSON Serialization', () {
      test('can be created from JSON', () {
        expect(Category.fromJson(categoryJson), isA<Category>());
      });

      test('can be mapped to JSON', () {
        expect(category.toJson(), equals(categoryJson));
      });
    });
  });
}
