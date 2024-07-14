// ignore_for_file: prefer_const_constructors

import 'package:aws_models/aws_models.dart';
import 'package:test/test.dart';

void main() {
  group('HtmlContent', () {
    const htmlContent = HtmlContent(
      data: 'data',
      charset: 'charset',
    );

    test('can be instantiated', () {
      expect(htmlContent, isNotNull);
    });

    test('supports value equality', () {
      expect(
        htmlContent,
        equals(
          HtmlContent(
            data: 'data',
            charset: 'charset',
          ),
        ),
      );
    });

    group('JSON serialization', () {
      final htmlContentJson = {
        'data': 'data',
        'charset': 'charset',
      };

      test('can create HtmlContent from JSON', () {
        expect(HtmlContent.fromJson(htmlContentJson), isA<HtmlContent>());
      });

      test('can map a HtmlContent to JSON', () {
        expect(htmlContent.toJson(), equals(htmlContentJson));
      });
    });
  });
}
