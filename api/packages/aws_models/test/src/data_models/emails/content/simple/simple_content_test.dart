// ignore_for_file: prefer_const_constructors

import 'package:aws_models/aws_models.dart';
import 'package:test/test.dart';

void main() {
  group('SimpleContent', () {
    const simpleContent = SimpleContent(
      body: SimpleBody.html(html: htmlContent),
      headers: [header],
      subject: subject,
    );
    test('can be instantiated', () {
      expect(simpleContent, isNotNull);
    });

    test('supports value equality', () {
      expect(
        simpleContent,
        equals(
          SimpleContent(
            body: SimpleBody.html(html: htmlContent),
            headers: const [header],
            subject: subject,
          ),
        ),
      );
    });

    group('JSON serialization', () {
      final simpleContentJson = {
        'body': {
          'html': {
            'data': '<html><body><h1>Hello, world!</h1></body></html>',
            'charset': null,
          },
          'text': null,
        },
        'headers': [
          {'name': 'Hello', 'value': 'World'},
        ],
        'subject': {'data': 'Hello', 'charset': null},
      };

      test('can create SimpleContent from JSON', () {
        expect(
          SimpleContent.fromJson(simpleContentJson),
          isA<SimpleContent>(),
        );
      });

      test('can map a SimpleContent to JSON', () {
        expect(
          simpleContent.toJson(),
          equals(simpleContentJson),
        );
      });
    });
  });
}
