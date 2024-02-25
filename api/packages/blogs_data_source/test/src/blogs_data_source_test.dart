// ignore_for_file: prefer_const_constructors
import 'package:blog_models/blog_models.dart';
import 'package:blogs_data_source/blogs_data_source.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../helpers/fixtures.dart';

class _MockButterCmsClient extends Mock implements ButterCmsClient {}

void main() {
  group('BlogsDataSource', () {
    group('ButterCmsBlogsDataSource', () {
      late ButterCmsClient client;
      late BlogsDataSource dataSource;

      setUp(() {
        client = _MockButterCmsClient();
        dataSource = ButterCmsBlogsDataSource(client: client);
      });

      test('can be instantiated', () {
        expect(ButterCmsBlogsDataSource(client: client), isNotNull);
      });

      test('can get blogs', () async {
        final response = BlogsResponse(
          meta: BlogsMeta(count: 1),
          data: [blog],
        );
        when(() => client.fetchBlogPosts()).thenAnswer(
          (_) async => response,
        );

        expect(await dataSource.getBlogs(), equals(response));
      });

      test('can get blog', () async {
        final response = BlogResponse(meta: BlogMeta(), data: blog);
        when(() => client.fetchBlogPost(slug: any(named: 'slug'))).thenAnswer(
          (_) async => response,
        );

        expect(await dataSource.getBlog('slug'), equals(response));
      });
    });
  });
}
