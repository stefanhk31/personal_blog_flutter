import 'package:blog_repository/blog_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
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
      router = createRouter();
    });

    testWidgets(
      'default route is BlogOverviewPage',
      (tester) async {
        when(blogRepository.getBlogPreviews).thenAnswer((_) async => []);

        await tester.pumpApp(
          blogRepository: blogRepository,
          router: router,
        );

        expect(find.byType(BlogOverviewPage), findsOneWidget);
      },
    );
  });
}
