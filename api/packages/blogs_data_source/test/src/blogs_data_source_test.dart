// ignore_for_file: prefer_const_constructors
import 'package:blogs_data_source/src/butter_cms_blogs_data_source.dart/butter_cms_blogs_data_source.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockButterCmsClient extends Mock implements ButterCmsClient {}

void main() {
  group('BlogsDataSource', () {
    group('ButterCmsBlogsDataSource', () {
      late ButterCmsClient client;

      setUp(() {
        client = _MockButterCmsClient();
      });

      test('can be instantiated', () {
        expect(ButterCmsBlogsDataSource(client: client), isNotNull);
      });
    });
  });
}
