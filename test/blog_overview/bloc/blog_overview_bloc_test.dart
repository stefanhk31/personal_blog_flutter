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

    group('when BlogOverviewInitialPostsRequested is added', () {
      blocTest<BlogOverviewBloc, BlogOverviewState>(
        'emits [BlogOverviewLoading, BlogOverviewSuccess] '
        'when BlogRepository returns posts',
        setUp: () {
          when(blogRepository.getBlogPreviews).thenAnswer(
            (_) async => _previewsResponse,
          );
        },
        build: () => BlogOverviewBloc(blogRepository: blogRepository),
        act: (bloc) => bloc.add(const BlogOverviewInitialPostsRequested()),
        expect: () => <BlogOverviewState>[
          const BlogOverviewLoading(),
          BlogOverviewLoaded(
            previews: _previewsResponse.previews,
            currentOffset: _previewsResponse.previews.length,
            hasReachedMax: true,
            count: _previewsResponse.count,
          ),
        ],
      );

      blocTest<BlogOverviewBloc, BlogOverviewState>(
        'emits [BlogOverviewLoading, BlogOverviewFailure] '
        'when BlogRepository throws an exception',
        setUp: () => when(blogRepository.getBlogPreviews)
            .thenThrow(Exception(failureMessage)),
        build: () => BlogOverviewBloc(blogRepository: blogRepository),
        act: (bloc) => bloc.add(const BlogOverviewInitialPostsRequested()),
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
        act: (bloc) => bloc.add(const BlogOverviewInitialPostsRequested()),
        expect: () => <BlogOverviewState>[
          const BlogOverviewLoading(),
          const BlogOverviewFailure(error: {'error': 'Not Found'}),
        ],
      );
    });

    group('when BlogOverviewAdditionalPostsRequested is added', () {
      blocTest<BlogOverviewBloc, BlogOverviewState>(
        'emits [BlogOverviewFailure] '
        'if initial state is not BlogOverviewLoaded',
        seed: () => const BlogOverviewInitial(),
        build: () => BlogOverviewBloc(blogRepository: blogRepository),
        act: (bloc) => bloc.add(const BlogOverviewAdditionalPostsRequested()),
        expect: () => [
          isA<BlogOverviewFailure>(),
        ],
      );

      blocTest<BlogOverviewBloc, BlogOverviewState>(
        'emits [BlogOverviewLoadingAdditionalItems] and [BlogOverviewLoaded] '
        'with additional posts when BlogRepository returns additional posts',
        setUp: () {
          when(blogRepository.getBlogPreviews).thenAnswer(
            (_) async => _previewsResponse,
          );
          when(
            () => blogRepository.getBlogPreviews(
              offset: any(named: 'offset'),
            ),
          ).thenAnswer(
            (_) async => _previewsResponse,
          );
        },
        seed: () => BlogOverviewLoaded(
          previews: _previewsResponse.previews,
          currentOffset: _previewsResponse.previews.length,
          hasReachedMax: true,
          count: _previewsResponse.count,
        ),
        build: () => BlogOverviewBloc(blogRepository: blogRepository),
        act: (bloc) => bloc.add(const BlogOverviewAdditionalPostsRequested()),
        expect: () => <BlogOverviewState>[
          BlogOverviewLoadingAdditionalItems(
            previews: _previewsResponse.previews,
            currentOffset: _previewsResponse.previews.length,
            hasReachedMax: true,
            count: _previewsResponse.count,
          ),
          BlogOverviewLoaded(
            previews: [
              ..._previewsResponse.previews,
              ..._previewsResponse.previews,
            ],
            currentOffset: _previewsResponse.previews.length * 2,
            hasReachedMax: true,
            count: _previewsResponse.count,
          ),
        ],
      );

      blocTest<BlogOverviewBloc, BlogOverviewState>(
        'emits [BlogOverviewLoadingAdditionalItems] and [BlogOverviewFailure] '
        'when BlogRepository throws exception',
        setUp: () {
          when(
            () => blogRepository.getBlogPreviews(
              offset: any(named: 'offset'),
            ),
          ).thenThrow(
            Exception(failureMessage),
          );
        },
        seed: () => BlogOverviewLoaded(
          previews: _previewsResponse.previews,
          currentOffset: _previewsResponse.previews.length,
          hasReachedMax: true,
          count: _previewsResponse.count,
        ),
        build: () => BlogOverviewBloc(blogRepository: blogRepository),
        act: (bloc) => bloc.add(const BlogOverviewAdditionalPostsRequested()),
        expect: () => <BlogOverviewState>[
          BlogOverviewLoadingAdditionalItems(
            previews: _previewsResponse.previews,
            currentOffset: _previewsResponse.previews.length,
            hasReachedMax: true,
            count: _previewsResponse.count,
          ),
          const BlogOverviewFailure(error: 'Exception: $failureMessage'),
        ],
      );

      blocTest<BlogOverviewBloc, BlogOverviewState>(
        'emits [BlogOverviewLoadingAdditionalItems] and [BlogOverviewFailure] '
        'when BlogRepository throws an api request failure',
        setUp: () => when(
          () => blogRepository.getBlogPreviews(
            offset: any(named: 'offset'),
          ),
        ).thenThrow(
          const BlogApiClientFailure(
            statusCode: 404,
            error: 'Not Found',
          ),
        ),
        seed: () => BlogOverviewLoaded(
          previews: _previewsResponse.previews,
          currentOffset: _previewsResponse.previews.length,
          hasReachedMax: true,
          count: _previewsResponse.count,
        ),
        build: () => BlogOverviewBloc(blogRepository: blogRepository),
        act: (bloc) => bloc.add(const BlogOverviewAdditionalPostsRequested()),
        expect: () => <BlogOverviewState>[
          const BlogOverviewLoading(),
          const BlogOverviewFailure(error: {'error': 'Not Found'}),
        ],
      );
    });
  });
}

final _previewsResponse = BlogPreviews(
  previews: [
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
  ],
  count: 2,
);
