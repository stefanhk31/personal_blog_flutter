import 'package:blog_models/blog_models.dart';
import 'package:test/test.dart';

import 'helpers/fixtures.dart';

void main() {
  group('Tag', () {
    test('can be instantiated', () {
      expect(
        tag,
        isNotNull,
      );
    });

    group('JSON Serialization', () {
      test('can be created from JSON', () {
        expect(Tag.fromJson(tagJson), isA<Tag>());
      });

      test('can be mapped to JSON', () {
        expect(tag.toJson(), equals(tagJson));
      });
    });
  });
}
