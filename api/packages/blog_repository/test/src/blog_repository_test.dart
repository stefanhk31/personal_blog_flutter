// ignore_for_file: prefer_const_constructors
import 'package:blog_html_builder/blog_html_builder.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockButterCmsClient extends Mock implements ButterCmsClient {}

class _MockTemplateEngine extends Mock implements TemplateEngine {}

void main() {
  group('BlogRepository', () {
    late ButterCmsClient cmsClient;
    late TemplateEngine templateEngine;
    late BlogRepository blogRepository;

    setUp(() {
      cmsClient = _MockButterCmsClient();
      templateEngine = _MockTemplateEngine();
      blogRepository =
          BlogRepository(cmsClient: cmsClient, templateEngine: templateEngine);
    });

    test('can be instantiated', () {
      expect(blogRepository, isNotNull);
    });

    group('getBlogDetailHtml', () {});
  });
}
