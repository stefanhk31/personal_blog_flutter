// ignore_for_file: prefer_const_constructors

import 'package:aws_models/aws_models.dart';
import 'package:test/test.dart';

void main() {
  group('EmailContent', () {
    const emailContent = EmailContent(
      simple: SimpleContent(
        subject: subject,
        headers: [header],
        body: SimpleBody.html(html: htmlContent),
      ),
    );
    test('can be instantiated', () {
      expect(emailContent, isNotNull);
    });

    test('supports value equality', () {
      expect(
        emailContent,
        equals(
          EmailContent(
            simple: SimpleContent(
              subject: subject,
              headers: const [header],
              body: SimpleBody.html(html: htmlContent),
            ),
          ),
        ),
      );
    });

    group('JSON serialization', () {
      final emailContentJson = {
        'simple': {
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
        },
      };

      test('can create EmailContent from JSON', () {
        expect(EmailContent.fromJson(emailContentJson), isA<EmailContent>());
      });

      test('can map a EmailContent to JSON', () {
        expect(emailContent.toJson(), equals(emailContentJson));
      });
    });
  });
}
