import 'package:blog_repository/blog_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_blog_flutter/app/app.dart';
import 'package:personal_blog_flutter/app/widgets/footer.dart';
import 'package:personal_blog_flutter/blog_overview/view/blog_overview_page.dart';

class _MockBlogRepository extends Mock implements BlogRepository {}

void main() {
  group('App', () {
    late BlogRepository blogRepository;

    setUp(() {
      blogRepository = _MockBlogRepository();
      when(blogRepository.getBlogPreviews).thenAnswer((_) async => []);
    });

    test('can be instantiated', () {
      expect(
        App(blogRepository: blogRepository),
        isNotNull,
      );
    });

    testWidgets('renders BlogOverview and Footer', (tester) async {
      await tester.pumpWidget(App(blogRepository: blogRepository));
      expect(find.byType(BlogOverviewPage), findsOneWidget);
      expect(find.byType(Footer), findsOneWidget);
    });
  });
}
