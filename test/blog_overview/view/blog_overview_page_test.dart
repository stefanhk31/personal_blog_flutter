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

import '../../helpers/helpers.dart';

class _MockBlogRepository extends Mock implements BlogRepository {}

class _MockBlogOverviewBloc
    extends MockBloc<BlogOverviewEvent, BlogOverviewState>
    implements BlogOverviewBloc {}

void main() {
  group('BlogOverviewPage', () {
    final blogRepository = _MockBlogRepository();

    testWidgets('renders BlogOverview', (tester) async {
      when(blogRepository.getBlogPreviews).thenAnswer((_) async => []);
      await tester.pumpApp(
        widget: const BlogOverviewPage(),
        blogRepository: blogRepository,
      );
      expect(find.byType(BlogOverview), findsOneWidget);
    });

    group('BlogOverview', () {
      final bloc = _MockBlogOverviewBloc();

      testWidgets('renders loading view', (tester) async {
        when(() => bloc.state).thenReturn(BlogOverviewLoading());
        await tester.pumpApp(
          widget: BlocProvider<BlogOverviewBloc>.value(
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
          widget: BlocProvider<BlogOverviewBloc>.value(
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
          widget: BlocProvider<BlogOverviewBloc>.value(
            value: bloc,
            child: const BlogOverview(),
          ),
        );
        expect(find.text(failureMessage), findsOneWidget);
      });

      testWidgets('renders header and blog cards', (tester) async {
        final previews = List.generate(
          3,
          (index) => BlogPreview(
            title: 'title $index',
            description: 'desc $index',
            authorName: 'author $index',
            published: DateTime.now(),
          ),
        );
        when(() => bloc.state)
            .thenReturn(BlogOverviewLoaded(previews: previews));
        await tester.pumpApp(
          widget: BlocProvider<BlogOverviewBloc>.value(
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
