// ignore_for_file: prefer_const_constructors

import 'package:aws_models/aws_models.dart';
import 'package:test/test.dart';

void main() {
  group('TextContent', () {
    const textContent = TextContent(
      data: 'data',
      charset: 'charset',
    );
    test('can be instantiated', () {
      expect(textContent, isNotNull);
    });

    test('supports value equality', () {
      expect(
        textContent,
        equals(
          TextContent(
            data: 'data',
            charset: 'charset',
          ),
        ),
      );
    });

    group('JSON serialization', () {
      final textContentJson = {
        'data': 'data',
        'charset': 'charset',
      };

      test('can create TextContent from JSON', () {
        expect(
          TextContent.fromJson(textContentJson),
          isA<TextContent>(),
        );
      });

      test('can map a TextContent to JSON', () {
        expect(
          textContent.toJson(),
          equals(textContentJson),
        );
      });
    });
  });
}
