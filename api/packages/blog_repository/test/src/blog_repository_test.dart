// ignore_for_file: prefer_const_constructors
import 'package:blog_models/blog_models.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockButterCmsClient extends Mock implements ButterCmsClient {}

void main() {
  group('BlogRepository', () {
    late ButterCmsClient cmsClient;
    late BlogRepository blogRepository;

    setUp(() {
      cmsClient = _MockButterCmsClient();
      blogRepository = BlogRepository(cmsClient: cmsClient);
    });

    test('can be instantiated', () {
      expect(blogRepository, isNotNull);
    });

    group('getBlogDetailHtml', () {});
  });
}
