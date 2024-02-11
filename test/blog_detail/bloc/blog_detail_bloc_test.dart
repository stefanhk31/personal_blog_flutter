import 'package:api_client/api_client.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_blog_flutter/blog_detail/bloc/blog_detail_bloc.dart';
import 'package:personal_blog_flutter/utils/url_launcher.dart';

import '../../helpers/helpers.dart';

class _MockBlogRepository extends Mock implements BlogRepository {}

class _MockUrlLauncher extends Mock implements UrlLauncher {}

void main() {
  group('BlogDetailBloc', () {
    final blogRepository = _MockBlogRepository();
    const slug = 'blog-slug';

    test('can be instantiated', () {
      expect(
        BlogDetailBloc(blogRepository: blogRepository, slug: slug),
        isNotNull,
      );
    });

    group('when BlogDetailRequested is added', () {
      blocTest<BlogDetailBloc, BlogDetailState>(
        'emits [BlogDetailLoading, BlogDetailLoaded] '
        'when BlogRepository returns detail',
        setUp: () {
          when(() => blogRepository.getBlogDetail(slug: any(named: 'slug')))
              .thenAnswer((_) async => dummyBlogDetail);
        },
        build: () => BlogDetailBloc(blogRepository: blogRepository, slug: slug),
        act: (bloc) => bloc.add(const BlogDetailRequested()),
        expect: () => <BlogDetailState>[
          BlogDetailLoading(),
          BlogDetailLoaded(detail: dummyBlogDetail),
        ],
      );

      blocTest<BlogDetailBloc, BlogDetailState>(
        'emits [BlogDetailLoading, BlogDetailFailure] '
        'when BlogRepository throws an exception',
        setUp: () => when(
          () => blogRepository.getBlogDetail(
            slug: any(named: 'slug'),
          ),
        ).thenThrow(Exception(failureMessage)),
        build: () => BlogDetailBloc(
          blogRepository: blogRepository,
          slug: slug,
        ),
        act: (bloc) => bloc.add(const BlogDetailRequested()),
        expect: () => <BlogDetailState>[
          BlogDetailLoading(),
          const BlogDetailFailure(message: 'Exception: $failureMessage'),
        ],
      );

      blocTest<BlogDetailBloc, BlogDetailState>(
        'emits [BlogDetailLoading, BlogDetailFailure] '
        'with request failure message '
        'when BlogRepository throws an api request failure',
        setUp: () => when(
          () => blogRepository.getBlogDetail(
            slug: any(named: 'slug'),
          ),
        ).thenThrow(
          ApiRequestFailure(statusCode: 404, body: 'Not Found'),
        ),
        build: () => BlogDetailBloc(
          blogRepository: blogRepository,
          slug: slug,
        ),
        act: (bloc) => bloc.add(const BlogDetailRequested()),
        expect: () => <BlogDetailState>[
          BlogDetailLoading(),
          const BlogDetailFailure(message: 'Not Found'),
        ],
      );
    });

    group('when BlogLinkClicked is added', () {
      final urlLauncher = _MockUrlLauncher();

      blocTest<BlogDetailBloc, BlogDetailState>(
        'launches url when url is valid',
        setUp: () {
          when(() => urlLauncher.validateUrl(url: any(named: 'url')))
              .thenAnswer((_) async => true);
          when(() => urlLauncher.launchUrl(url: any(named: 'url')))
              .thenAnswer((_) async {});
        },
        build: () => BlogDetailBloc(
          blogRepository: blogRepository,
          slug: slug,
          urlLauncher: urlLauncher,
        ),
        act: (bloc) => bloc.add(const BlogLinkClicked(url: 'https://url.com')),
        verify: (_) {
          verify(() => urlLauncher.launchUrl(url: any(named: 'url'))).called(1);
        },
      );

      blocTest<BlogDetailBloc, BlogDetailState>(
        'does not launch url when url is invalid',
        setUp: () {
          when(() => urlLauncher.validateUrl(url: any(named: 'url')))
              .thenAnswer((_) async => false);
          when(() => urlLauncher.launchUrl(url: any(named: 'url')))
              .thenAnswer((_) async {});
        },
        build: () => BlogDetailBloc(
          blogRepository: blogRepository,
          slug: slug,
          urlLauncher: urlLauncher,
        ),
        act: (bloc) => bloc.add(const BlogLinkClicked(url: 'invalid-url')),
        verify: (_) {
          verifyNever(() => urlLauncher.launchUrl(url: any(named: 'url')));
        },
      );

      blocTest<BlogDetailBloc, BlogDetailState>(
        'emits [BlogDetailFailure] when url launcher throws exception',
        setUp: () {
          when(() => urlLauncher.validateUrl(url: any(named: 'url')))
              .thenThrow(Exception(failureMessage));
        },
        build: () => BlogDetailBloc(
          blogRepository: blogRepository,
          slug: slug,
          urlLauncher: urlLauncher,
        ),
        act: (bloc) => bloc.add(const BlogLinkClicked(url: 'invalid-url')),
        expect: () => const <BlogDetailState>[
          BlogDetailFailure(message: 'Exception: $failureMessage'),
        ],
      );
    });
  });
}
