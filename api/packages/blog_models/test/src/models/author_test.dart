import 'package:blog_models/blog_models.dart';
import 'package:test/test.dart';

void main() {
  group('Author', () {
    test('can be instantiated', () {
      expect(
        author,
        isNotNull,
      );
    });

    test('supports value equality', () {
      expect(author, equals(author));
    });

    group('JSON Serialization', () {
      test('can be created from JSON', () {
        expect(Author.fromJson(authorJson), isA<Author>());
      });

      test('can be mapped to JSON', () {
        expect(author.toJson(), equals(authorJson));
      });
    });
  });
}
