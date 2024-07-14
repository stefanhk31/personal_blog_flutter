// ignore_for_file: prefer_const_constructors

import 'package:aws_models/aws_models.dart';
import 'package:test/test.dart';

void main() {
  group('SendEmailRequest', () {
    const sendEmailRequest = SendEmailRequest(
      content: EmailContent(
        simple: SimpleContent(
          subject: subject,
          headers: [header],
          body: SimpleBody.html(html: htmlContent),
        ),
      ),
    );
    test('can be instantiated', () {
      expect(sendEmailRequest, isNotNull);
    });

    test('supports value equality', () {
      expect(
        sendEmailRequest,
        equals(
          SendEmailRequest(
            content: EmailContent(
              simple: SimpleContent(
                subject: subject,
                headers: const [header],
                body: SimpleBody.html(html: htmlContent),
              ),
            ),
          ),
        ),
      );
    });

    group('JSON serialization', () {
      final sendEmailRequestJson = {
        'content': {
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
        },
        'configurationSetName': null,
        'destination': null,
        'emailTags': null,
        'feedbackForwardingEmailAddress': null,
        'feedbackForwardingEmailAddressIdentityArn': null,
        'fromEmailAddress': null,
        'fromEmailAddressIdentityArn': null,
        'listManagementOptions': null,
        'replyToAddresses': null,
      };

      test('can create SendEmailRequest from JSON', () {
        expect(
          SendEmailRequest.fromJson(sendEmailRequestJson),
          isA<SendEmailRequest>(),
        );
      });

      test('can map a SendEmailRequest to JSON', () {
        expect(sendEmailRequest.toJson(), equals(sendEmailRequestJson));
      });
    });
  });
}
