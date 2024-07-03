// ignore_for_file: prefer_const_constructors
import 'package:aws_ses_client/aws_ses_client.dart';
import 'package:test/test.dart';

void main() {
  group('AwsSesClient', () {
    test('can be instantiated', () {
      expect(AwsSesClient(), isNotNull);
    });
  });
}
