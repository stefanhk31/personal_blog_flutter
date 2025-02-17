// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:blog_html_builder/blog_html_builder.dart';
import 'package:blog_models/blog_models.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:http/http.dart';
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

    group('getBlogDetailHtml', () {
      test(
          'uses template engine to render blog detail page '
          'when api call is successful', () async {
        when(() => cmsClient.fetchBlogPost(slug: any(named: 'slug')))
            .thenAnswer(
          (_) async => Response(
            jsonEncode({
              'meta': blogMetaJson,
              'data': blogJson,
            }),
            200,
          ),
        );

        when(
          () => templateEngine.render(
            filePath: 'blog_detail_page.html',
            context: any(named: 'context'),
          ),
        ).thenAnswer((_) async => '<html></html>');

        await blogRepository.getBlogDetailHtml('my-blog-post');
        verify(
          () => templateEngine.render(
            filePath: 'blog_detail_page.html',
            context: any(named: 'context'),
          ),
        ).called(1);
      });

      test(
          'uses template engine to render error page '
          'when api call is not successful', () async {
        when(() => cmsClient.fetchBlogPost(slug: any(named: 'slug')))
            .thenAnswer(
          (_) async => Response(
            'bad request',
            400,
          ),
        );

        when(
          () => templateEngine.render(
            filePath: 'error_page.html',
            context: any(named: 'context'),
          ),
        ).thenAnswer((_) async => '<html></html>');

        await blogRepository.getBlogDetailHtml('my-blog-post');
        verify(
          () => templateEngine.render(
            filePath: 'error_page.html',
            context: any(named: 'context'),
          ),
        ).called(1);
      });

      test(
          'uses template engine to render error page '
          'when an unexpected error occurs', () async {
        when(() => cmsClient.fetchBlogPost(slug: any(named: 'slug')))
            .thenAnswer(
          (_) async => Response(
            jsonEncode({
              'meta': blogMetaJson,
              'data': blogJson,
            }),
            200,
          ),
        );

        when(
          () => templateEngine.render(
            filePath: 'blog_detail_page.html',
            context: any(named: 'context'),
          ),
        ).thenThrow(Exception('error rendering template'));

        when(
          () => templateEngine.render(
            filePath: 'error_page.html',
            context: any(named: 'context'),
          ),
        ).thenAnswer((_) async => '<html></html>');

        await blogRepository.getBlogDetailHtml('my-blog-post');
        verify(
          () => templateEngine.render(
            filePath: 'error_page.html',
            context: any(named: 'context'),
          ),
        ).called(1);
      });
    });
  });
}
