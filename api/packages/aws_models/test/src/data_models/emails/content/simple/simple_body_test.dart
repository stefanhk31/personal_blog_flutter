// ignore_for_file: prefer_const_constructors

import 'package:aws_models/aws_models.dart';
import 'package:test/test.dart';

void main() {
  group('SimpleBody', () {
    const simpleBody = SimpleBody();
    const simpleBodyHtml = SimpleBody.html(html: htmlContent);
    const simpleBodyText = SimpleBody.text(text: textContent);

    group('can be instantiated', () {
      test('from simple constructor', () {
        expect(simpleBody, isNotNull);
      });

      test('from html constructor', () {
        expect(simpleBodyHtml, isNotNull);
      });

      test('from text constructor', () {
        expect(simpleBodyText, isNotNull);
      });
    });

    test('supports value equality', () {
      expect(
        simpleBody,
        equals(SimpleBody()),
      );
    });

    group('JSON serialization', () {
      final simpleBodyHtmlJson = {
        'html': {
          'data': '<html><body><h1>Hello, world!</h1></body></html>',
          'charset': null,
        },
        'text': null,
      };

      test('can create SimpleBody from JSON', () {
        expect(SimpleBody.fromJson(simpleBodyHtmlJson), isA<SimpleBody>());
      });

      test('can map a SimpleBody to JSON', () {
        expect(simpleBodyHtml.toJson(), equals(simpleBodyHtmlJson));
      });
    });
  });
}
