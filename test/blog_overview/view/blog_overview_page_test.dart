import 'package:bloc_test/bloc_test.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_blog_flutter/blog_overview/bloc/blog_overview_bloc.dart';
import 'package:personal_blog_flutter/blog_overview/view/blog_overview_page.dart';
import 'package:personal_blog_flutter/blog_overview/widgets/blog_overview_header.dart';
import 'package:personal_blog_flutter/l10n/l10n.dart';

import '../../helpers/helpers.dart';

class _MockBlogRepository extends Mock implements BlogRepository {}

class _MockBlogOverviewBloc
    extends MockBloc<BlogOverviewEvent, BlogOverviewState>
    implements BlogOverviewBloc {}

void main() {
  group('BlogOverviewPage', () {
    final blogRepository = _MockBlogRepository();

    testWidgets('renders BlogOverview', (tester) async {
      when(blogRepository.getBlogPosts).thenAnswer((_) async => []);
      await tester.pumpApp(
        const BlogOverviewPage(),
        blogRepository: blogRepository,
      );
      expect(find.byType(BlogOverview), findsOneWidget);
    });

    group('BlogOverview', () {
      final bloc = _MockBlogOverviewBloc();

      testWidgets('renders loading view', (tester) async {
        when(() => bloc.state).thenReturn(BlogOverviewLoading());
        await tester.pumpApp(
          BlocProvider<BlogOverviewBloc>.value(
            value: bloc,
            child: const BlogOverview(),
          ),
        );
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('renders error view', (tester) async {
        const failureMessage = 'oops';
        when(() => bloc.state).thenReturn(
          BlogOverviewFailure(
            message: failureMessage,
          ),
        );
        await tester.pumpApp(
          BlocProvider<BlogOverviewBloc>.value(
            value: bloc,
            child: const BlogOverview(),
          ),
        );
        expect(find.text(failureMessage), findsOneWidget);
      });

      testWidgets('renders error view', (tester) async {
        const failureMessage = 'oops';
        when(() => bloc.state).thenReturn(
          BlogOverviewFailure(
            message: failureMessage,
          ),
        );
        await tester.pumpApp(
          BlocProvider<BlogOverviewBloc>.value(
            value: bloc,
            child: const BlogOverview(),
          ),
        );
        expect(find.text(failureMessage), findsOneWidget);
      });

      testWidgets('renders header and blog cards', (tester) async {
        final posts = List.generate(
          3,
          (index) => BlogPost(
            preview: BlogPreview(
              title: 'title $index',
              description: 'desc $index',
              authorName: 'author $index',
              published: DateTime.now(),
            ),
            detail: BlogDetail(
              title: 'title $index',
              published: DateTime.now(),
              body: 'body $index',
            ),
          ),
        );
        when(() => bloc.state).thenReturn(BlogOverviewLoaded(posts: posts));
        await tester.pumpApp(
          BlocProvider<BlogOverviewBloc>.value(
            value: bloc,
            child: const BlogOverview(),
          ),
        );
        expect(find.byType(BlogOverviewHeader), findsOneWidget);
        expect(find.byType(BlogCard), findsNWidgets(3));
      });
    });
  });
}
