// ignore_for_file: prefer_const_constructors
import 'package:aws_client/aws_client.dart';
import 'package:test/test.dart';

void main() {
  group('AwsClient', () {
    test('can be instantiated', () {
      expect(AwsClient(), isNotNull);
    });
  });
}
