// ignore_for_file: prefer_const_constructors

import 'package:aws_models/aws_models.dart';
import 'package:test/test.dart';

void main() {
  group('EmailTag', () {
    const emailTag = EmailTag(
      name: 'name',
      value: 'value',
    );
    test('can be instantiated', () {
      expect(emailTag, isNotNull);
    });

    test('supports value equality', () {
      expect(
        emailTag,
        equals(
          EmailTag(
            name: 'name',
            value: 'value',
          ),
        ),
      );
    });

    group('JSON serialization', () {
      final emailTagJson = {
        'name': 'name',
        'value': 'value',
      };

      test('can create EmailTag from JSON', () {
        expect(EmailTag.fromJson(emailTagJson), isA<EmailTag>());
      });

      test('can map a EmailTag to JSON', () {
        expect(emailTag.toJson(), equals(emailTagJson));
      });
    });
  });
}
