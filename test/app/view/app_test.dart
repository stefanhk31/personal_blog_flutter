import 'package:blog_repository/blog_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_blog_flutter/app/app.dart';
import 'package:personal_blog_flutter/blog_overview/view/blog_overview_page.dart';

class _MockBlogRepository extends Mock implements BlogRepository {}

void main() {
  group('App', () {
    late BlogRepository blogRepository;

    setUp(() {
      blogRepository = _MockBlogRepository();
      when(blogRepository.getBlogPosts).thenAnswer((_) async => []);
    });

    testWidgets('renders BlogOverview', (tester) async {
      await tester.pumpWidget(App(blogRepository: blogRepository));
      expect(find.byType(BlogOverviewPage), findsOneWidget);
    });
  });
}
