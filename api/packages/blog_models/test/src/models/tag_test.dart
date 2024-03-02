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
      expect(tag, equals(tag));
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
