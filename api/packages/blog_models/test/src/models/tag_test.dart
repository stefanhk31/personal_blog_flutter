// ignore_for_file: prefer_const_constructors

import 'package:blog_models/blog_models.dart';
import 'package:test/test.dart';

void main() {
  group('Tag', () {
    test('can be instantiated', () {
      expect(
        tag,
        isNotNull,
      );
    });

    test('supports value equality', () {
      expect(
        Tag(name: 'name', slug: 'slug'),
        equals(
          Tag(name: 'name', slug: 'slug'),
        ),
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
