import 'package:api_client/api_client.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_blog_flutter/blog_overview/bloc/blog_overview_bloc.dart';

class _MockBlogRepository extends Mock implements BlogRepository {}

void main() {
  group('BlogOverviewBloc', () {
    final blogRepository = _MockBlogRepository();
    const failureMessage = 'oops';

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
        act: (bloc) => bloc.add(BlogOverviewPostsRequested()),
        expect: () => <BlogOverviewState>[
          BlogOverviewLoading(),
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
        act: (bloc) => bloc.add(BlogOverviewPostsRequested()),
        expect: () => <BlogOverviewState>[
          BlogOverviewLoading(),
          BlogOverviewFailure(message: 'Exception: $failureMessage'),
        ],
      );

      blocTest<BlogOverviewBloc, BlogOverviewState>(
        'emits [BlogOverviewLoading, BlogOverviewFailure] '
        'with request failure message '
        'when BlogRepository throws an api request failure',
        setUp: () => when(blogRepository.getBlogPreviews).thenThrow(
          ApiRequestFailure(statusCode: 404, body: 'Not Found'),
        ),
        build: () => BlogOverviewBloc(blogRepository: blogRepository),
        act: (bloc) => bloc.add(BlogOverviewPostsRequested()),
        expect: () => <BlogOverviewState>[
          BlogOverviewLoading(),
          BlogOverviewFailure(message: 'Not Found'),
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
  ),
  BlogPreview(
    title: 'title',
    description: 'description',
    published: DateTime.now(),
    authorName: 'authorName',
  ),
];
