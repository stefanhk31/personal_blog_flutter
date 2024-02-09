import 'package:api_client/api_client.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_blog_flutter/blog_detail/bloc/blog_detail_bloc.dart';

import '../../helpers/helpers.dart';

class _MockBlogRepository extends Mock implements BlogRepository {}

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
              .thenAnswer((_) async => _detail);
        },
        build: () => BlogDetailBloc(blogRepository: blogRepository, slug: slug),
        act: (bloc) => bloc.add(BlogDetailRequested()),
        expect: () => <BlogDetailState>[
          BlogDetailLoading(),
          BlogDetailLoaded(detail: _detail),
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
        act: (bloc) => bloc.add(BlogDetailRequested()),
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
        act: (bloc) => bloc.add(BlogDetailRequested()),
        expect: () => <BlogDetailState>[
          BlogDetailLoading(),
          const BlogDetailFailure(message: 'Not Found'),
        ],
      );
    });
  });
}

final _detail = BlogDetail(
  title: 'title',
  published: DateTime.now(),
  body: 'body',
  author: const Author(
    firstName: 'firstName',
    lastName: 'lastName',
    email: 'email',
    slug: 'slug',
    bio: 'bio',
    title: 'title',
    linkedinUrl: 'linkedinUrl',
    facebookUrl: 'facebookUrl',
    twitterHandle: 'twitterHandle',
    profileImage: 'profileImage',
  ),
  categories: const [],
  tags: const [],
  slug: 'slug',
  url: 'url',
  featuredImage: 'featuredImage',
  featuredImageAlt: 'featuredImageAlt',
);
