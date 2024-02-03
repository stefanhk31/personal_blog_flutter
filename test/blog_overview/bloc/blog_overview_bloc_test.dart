import 'package:bloc_test/bloc_test.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
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
          when(blogRepository.getBlogPosts).thenAnswer(
            (_) async => _posts,
          );
        },
        build: () => BlogOverviewBloc(blogRepository: blogRepository),
        act: (bloc) => bloc.add(BlogOverviewPostsRequested()),
        expect: () => <BlogOverviewState>[
          BlogOverviewLoading(),
          BlogOverviewLoaded(
            posts: _posts,
          ),
        ],
      );

      blocTest<BlogOverviewBloc, BlogOverviewState>(
        'emits [BlogOverviewLoading, BlogOverviewFailure] '
        'when BlogRepository throws an exception',
        setUp: () => when(blogRepository.getBlogPosts)
            .thenThrow(Exception(failureMessage)),
        build: () => BlogOverviewBloc(blogRepository: blogRepository),
        act: (bloc) => bloc.add(BlogOverviewPostsRequested()),
        expect: () => <BlogOverviewState>[
          BlogOverviewLoading(),
          BlogOverviewFailure(message: 'Exception: $failureMessage'),
        ],
      );
    });
  });
}

final _posts = [
  BlogPost(
    preview: BlogPreview(
      title: 'title',
      description: 'description',
      published: DateTime.now(),
      authorName: 'authorName',
    ),
    detail: BlogDetail(
      title: 'title',
      published: DateTime.now(),
      body: 'body',
    ),
  ),
  BlogPost(
    preview: BlogPreview(
      title: 'title',
      description: 'description',
      published: DateTime.now(),
      authorName: 'authorName',
    ),
    detail: BlogDetail(
      title: 'title',
      published: DateTime.now(),
      body: 'body',
    ),
  ),
];