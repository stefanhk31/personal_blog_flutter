import 'package:api_client/api_client.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_blog_flutter/blog_detail/bloc/blog_detail_bloc.dart';

import '../../helpers/helpers.dart';

class _MockBlogRepository extends Mock implements BlogRepository {}

void main() {
  group('BlogDetailBloc', () {
    final blogRepository = _MockBlogRepository();

    test('can be instantiated', () {
      expect(
        BlogDetailBloc(blogRepository: blogRepository),
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
        build: () => BlogDetailBloc(blogRepository: blogRepository),
        act: (bloc) => bloc.add(const BlogDetailRequested(slug: 'slug')),
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
        build: () => BlogDetailBloc(blogRepository: blogRepository),
        act: (bloc) => bloc.add(const BlogDetailRequested(slug: 'slug')),
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
        build: () => BlogDetailBloc(blogRepository: blogRepository),
        act: (bloc) => bloc.add(const BlogDetailRequested(slug: 'slug')),
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
);
