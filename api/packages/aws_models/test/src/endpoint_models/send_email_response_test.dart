// ignore_for_file: prefer_const_constructors

import 'package:aws_models/aws_models.dart';
import 'package:test/test.dart';

void main() {
  group('SendEmailResponse', () {
    const sendEmailResponse = SendEmailResponse(
      messageId: '123',
    );
    test('can be instantiated', () {
      expect(sendEmailResponse, isNotNull);
    });

    test('supports value equality', () {
      expect(
        sendEmailResponse,
        equals(
          SendEmailResponse(
            messageId: '123',
          ),
        ),
      );
    });

    group('JSON serialization', () {
      final sendEmailResponseJson = {
        'messageId': '123',
      };

      test('can create SendEmailResponse from JSON', () {
        expect(
          SendEmailResponse.fromJson(sendEmailResponseJson),
          isA<SendEmailResponse>(),
        );
      });

      test('can map a SendEmailResponse to JSON', () {
        expect(sendEmailResponse.toJson(), equals(sendEmailResponseJson));
      });
    });
  });
}
