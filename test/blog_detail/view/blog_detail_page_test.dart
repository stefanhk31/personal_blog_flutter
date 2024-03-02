import 'package:bloc_test/bloc_test.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_blog_flutter/blog_detail/bloc/blog_detail_bloc.dart';
import 'package:personal_blog_flutter/blog_detail/view/blog_detail_page.dart';

import '../../helpers/helpers.dart';

class _MockBlogRepository extends Mock implements BlogRepository {}

class _MockBlogDetailBloc extends MockBloc<BlogDetailEvent, BlogDetailState>
    implements BlogDetailBloc {}

void main() {
  group('BlogDetailPage', () {
    final blogRepository = _MockBlogRepository();

    testWidgets('renders BlogDetailView', (tester) async {
      when(
        () => blogRepository.getBlogDetail(slug: any(named: 'slug')),
      ).thenAnswer((_) async => dummyBlogDetail);
      await tester.pumpApp(
        const BlogDetailPage(slug: 'slug'),
        blogRepository: blogRepository,
      );
      expect(find.byType(BlogDetailView), findsOneWidget);
    });

    group('BlogDetailView', () {
      final bloc = _MockBlogDetailBloc();

      testWidgets('renders loading view', (tester) async {
        when(() => bloc.state).thenReturn(BlogDetailLoading());
        await tester.pumpApp(
          BlocProvider<BlogDetailBloc>.value(
            value: bloc,
            child: const BlogDetailView(),
          ),
        );
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('renders error view', (tester) async {
        when(() => bloc.state).thenReturn(
          const BlogDetailFailure(
            error: failureMessage,
          ),
        );
        await tester.pumpApp(
          BlocProvider<BlogDetailBloc>.value(
            value: bloc,
            child: const BlogDetailView(),
          ),
        );
        expect(find.text(failureMessage), findsOneWidget);
      });

      testWidgets('renders author tile and html body', (tester) async {
        when(() => bloc.state).thenReturn(
          BlogDetailLoaded(detail: dummyBlogDetail),
        );
        await tester.pumpApp(
          BlocProvider<BlogDetailBloc>.value(
            value: bloc,
            child: const BlogDetailView(),
          ),
        );
        expect(find.byType(AuthorTile), findsOneWidget);
        expect(find.byType(Html), findsOneWidget);
      });

      testWidgets('renders hero when featured image is not null',
          (tester) async {
        when(() => bloc.state).thenReturn(
          BlogDetailLoaded(detail: _blogDetailWithImage),
        );
        await tester.pumpApp(
          BlocProvider<BlogDetailBloc>.value(
            value: bloc,
            child: const BlogDetailView(),
          ),
        );
        expect(find.byType(Hero), findsOneWidget);
      });

      // fix test after fixing flaky behavior
      // https://github.com/stefanhk31/personal_blog_flutter/issues/42
      testWidgets('clicking on HTML hyperlink adds BlogLinkClicked event',
          skip: true, (tester) async {
        when(() => bloc.state).thenReturn(
          BlogDetailLoaded(detail: _blogDetailWithHyperlink),
        );
        await tester.pumpApp(
          BlocProvider<BlogDetailBloc>.value(
            value: bloc,
            child: const BlogDetailView(),
          ),
        );
        await tester.tap(find.byType(Html));
        await tester.pumpAndSettle();
        verify(() => bloc.add(const BlogLinkClicked(url: 'https://url')))
            .called(1);
      });
    });
  });
}

final _blogDetailWithImage = BlogDetail(
  title: 'title',
  published: DateTime.now(),
  body: 'body',
  slug: 'slug',
  author: const BlogAuthor(
    firstName: 'firstName',
    lastName: 'lastName',
    slug: 'slug',
    bio: 'bio',
    linkedinUrl: 'linkedinUrl',
    facebookUrl: 'facebookUrl',
    profileImage: 'profileImage',
  ),
  tags: const [],
  categories: const [],
  featuredImage: 'featuredImage',
  featuredImageAlt: 'featuredImageAlt',
);

final _blogDetailWithHyperlink = BlogDetail(
  title: 'title',
  published: DateTime.now(),
  body: '<a href="https://url">body</a>',
  slug: 'slug',
  author: const BlogAuthor(
    firstName: 'firstName',
    lastName: 'lastName',
    slug: 'slug',
    bio: 'bio',
    linkedinUrl: 'linkedinUrl',
    facebookUrl: 'facebookUrl',
    profileImage: 'profileImage',
  ),
  tags: const [],
  categories: const [],
);
