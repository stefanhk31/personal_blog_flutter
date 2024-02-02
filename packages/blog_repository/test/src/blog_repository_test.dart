// ignore_for_file: prefer_const_constructors
import 'package:blog_repository/blog_repository.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockButterCmsClient extends Mock implements ButterCmsClient {}

void main() {
  group('BlogRepository', () {
    test('can be instantiated', () {
      expect(
        BlogRepository(butterCmsClient: _MockButterCmsClient()),
        isNotNull,
      );
    });
  });
}
