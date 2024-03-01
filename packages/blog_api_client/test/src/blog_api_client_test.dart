// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:blog_api_client/blog_api_client.dart';

void main() {
  group('BlogApiClient', () {
    test('can be instantiated', () {
      expect(BlogApiClient(), isNotNull);
    });
  });
}
