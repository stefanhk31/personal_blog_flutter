import 'package:blog_models/blog_models.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_blog_flutter/app/widgets/widgets.dart';
import 'package:personal_blog_flutter/blog_detail/view/blog_detail_page.dart';
import 'package:personal_blog_flutter/blog_overview/view/blog_overview_page.dart';
import 'package:personal_blog_flutter/router/router.dart';

import '../helpers/helpers.dart';

class _MockBlogRepository extends Mock implements BlogRepository {}

void main() {
  group('GoRouter', () {
    late BlogRepository blogRepository;
    late GoRouter router;

    setUp(() {
      blogRepository = _MockBlogRepository();
      when(blogRepository.getBlogPreviews)
          .thenAnswer((_) async => const BlogPreviews(previews: [], count: 0));
      when(() => blogRepository.getBlogDetail(slug: any(named: 'slug')))
          .thenAnswer((_) async => dummyBlogDetail);
      router = createRouter();
    });

    testWidgets('displays footer at bottom of route', (tester) async {
      await tester.pumpAppWithRouter(
        router,
        blogRepository: blogRepository,
      );

      expect(find.byType(Footer), findsOneWidget);
    });

    testWidgets(
      'default route is BlogOverviewPage',
      (tester) async {
        await tester.pumpAppWithRouter(
          router,
          blogRepository: blogRepository,
        );

        expect(find.byType(BlogOverviewPage), findsOneWidget);
      },
    );

    testWidgets(
      'navigating to /:slug should build BlogDetailPage',
      (tester) async {
        const slug = 'blog-post-slug';
        await tester.pumpAppWithRouter(
          router,
          blogRepository: blogRepository,
        );

        router.go('/$slug');

        await tester.pumpAndSettle();

        expect(find.byType(BlogDetailPage), findsOneWidget);
      },
    );
  });
}
