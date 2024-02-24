// ignore_for_file: prefer_const_constructors
import 'package:blogs_data_source/src/butter_cms_blogs_data_source.dart/butter_cms_blogs_data_source.dart';
import 'package:test/test.dart';

void main() {
  group('BlogsDataSource', () {
    group('ButterCmsBlogsDataSource', () {
      test('can be instantiated', () {
        expect(ButterCmsBlogsDataSource(), isNotNull);
      });
    });
  });
}
