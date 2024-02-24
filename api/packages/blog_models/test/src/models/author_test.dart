import 'package:blog_models/blog_models.dart';
import 'package:test/test.dart';

import 'helpers/fixtures.dart';

void main() {
  group('Author', () {
    test('can be instantiated', () {
      expect(
        author,
        isNotNull,
      );
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
