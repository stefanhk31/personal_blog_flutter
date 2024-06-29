import 'package:bloc_test/bloc_test.dart';
import 'package:blog_models/blog_models.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_blog_flutter/blog_overview/bloc/blog_overview_bloc.dart';
import 'package:personal_blog_flutter/blog_overview/view/blog_overview_page.dart';

import '../../helpers/helpers.dart';

class _MockBlogRepository extends Mock implements BlogRepository {}

class _MockBlogOverviewBloc
    extends MockBloc<BlogOverviewEvent, BlogOverviewState>
    implements BlogOverviewBloc {}

void main() {
  group('BlogOverviewPage', () {
    final blogRepository = _MockBlogRepository();

    testWidgets('renders BlogOverview', (tester) async {
      when(blogRepository.getBlogPreviews)
          .thenAnswer((_) async => const BlogPreviews(previews: [], count: 0));
      when(() => blogRepository.getBlogDetail(slug: any(named: 'slug')))
          .thenAnswer((_) async => dummyBlogDetail);
      await tester.pumpApp(
        const BlogOverviewPage(),
        blogRepository: blogRepository,
      );
      expect(find.byType(BlogOverview), findsOneWidget);
    });

    group('BlogOverview', () {
      final bloc = _MockBlogOverviewBloc();

      testWidgets('renders loading view', (tester) async {
        when(() => bloc.state).thenReturn(const BlogOverviewLoading());
        await tester.pumpApp(
          BlocProvider<BlogOverviewBloc>.value(
            value: bloc,
            child: const BlogOverview(),
          ),
        );
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('renders error view', (tester) async {
        when(() => bloc.state).thenReturn(
          const BlogOverviewFailure(
            error: failureMessage,
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

      group('_BlogOverviewContent', () {
        final previews = List.generate(
          3,
          (index) => BlogPreview(
            title: 'title $index',
            description: 'desc $index',
            authorName: 'author $index',
            published: DateTime.now(),
            slug: 'slug-$index',
          ),
        );
        testWidgets('renders header and blog cards', (tester) async {
          when(() => bloc.state)
              .thenReturn(BlogOverviewLoaded(previews: previews));
          await tester.pumpApp(
            BlocProvider<BlogOverviewBloc>.value(
              value: bloc,
              child: const BlogOverview(),
            ),
          );
          expect(find.byType(BlogListHeader), findsOneWidget);
          expect(find.byType(BlogCard), findsNWidgets(3));
        });

        testWidgets(
          'tapping on card navigates to blog detail page',
          (tester) async {
            when(() => bloc.state)
                .thenReturn(BlogOverviewLoaded(previews: previews));
            final router = MockGoRouter();
            when(() => router.go(any())).thenAnswer((_) async {});
            await tester.pumpApp(
              BlocProvider<BlogOverviewBloc>.value(
                value: bloc,
                child: const BlogOverview(),
              ),
              router: router,
            );

            await tester.tap(find.byType(BlogCard).first);
            await tester.pumpAndSettle();
            verify(() => router.go('/${previews.first.slug}')).called(1);
          },
        );
      });
    });
  });
}
