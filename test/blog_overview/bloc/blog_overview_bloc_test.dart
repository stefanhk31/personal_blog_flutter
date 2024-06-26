import 'package:bloc_test/bloc_test.dart';
import 'package:blog_api_client/blog_api_client.dart';
import 'package:blog_models/blog_models.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_blog_flutter/blog_overview/bloc/blog_overview_bloc.dart';

import '../../helpers/helpers.dart';

class _MockBlogRepository extends Mock implements BlogRepository {}

void main() {
  group('BlogOverviewBloc', () {
    final blogRepository = _MockBlogRepository();

    test('can be instantiated', () {
      expect(
        BlogOverviewBloc(blogRepository: blogRepository),
        isNotNull,
      );
    });

    group('when BlogOverviewPostsRequested is added', () {
      blocTest<BlogOverviewBloc, BlogOverviewState>(
        'emits [BlogOverviewLoading, BlogOverviewSuccess] '
        'when BlogRepository returns posts',
        setUp: () {
          when(blogRepository.getBlogPreviews).thenAnswer(
            (_) async => _previews,
          );
        },
        build: () => BlogOverviewBloc(blogRepository: blogRepository),
        act: (bloc) => bloc.add(const BlogOverviewPostsRequested()),
        expect: () => <BlogOverviewState>[
          const BlogOverviewLoading(),
          BlogOverviewLoaded(
            previews: _previews,
          ),
        ],
      );

      blocTest<BlogOverviewBloc, BlogOverviewState>(
        'emits [BlogOverviewLoading, BlogOverviewFailure] '
        'when BlogRepository throws an exception',
        setUp: () => when(blogRepository.getBlogPreviews)
            .thenThrow(Exception(failureMessage)),
        build: () => BlogOverviewBloc(blogRepository: blogRepository),
        act: (bloc) => bloc.add(const BlogOverviewPostsRequested()),
        expect: () => <BlogOverviewState>[
          const BlogOverviewLoading(),
          const BlogOverviewFailure(error: 'Exception: $failureMessage'),
        ],
      );

      blocTest<BlogOverviewBloc, BlogOverviewState>(
        'emits [BlogOverviewLoading, BlogOverviewFailure] '
        'with request failure message '
        'when BlogRepository throws an api request failure',
        setUp: () => when(blogRepository.getBlogPreviews).thenThrow(
          const BlogApiClientFailure(
            statusCode: 404,
            error: 'Not Found',
          ),
        ),
        build: () => BlogOverviewBloc(blogRepository: blogRepository),
        act: (bloc) => bloc.add(const BlogOverviewPostsRequested()),
        expect: () => <BlogOverviewState>[
          const BlogOverviewLoading(),
          const BlogOverviewFailure(error: {'error': 'Not Found'}),
        ],
      );
    });
  });
}

final _previews = [
  BlogPreview(
    title: 'title',
    description: 'description',
    published: DateTime.now(),
    authorName: 'authorName',
    slug: 'slug',
  ),
  BlogPreview(
    title: 'title',
    description: 'description',
    published: DateTime.now(),
    authorName: 'authorName',
    slug: 'slug',
  ),
];
