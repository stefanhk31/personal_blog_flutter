import 'package:blog_models/blog_models.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_blog_flutter/app/app.dart';
import 'package:personal_blog_flutter/app/widgets/footer/view/footer.dart';
import 'package:personal_blog_flutter/blog_overview/view/blog_overview_page.dart';

class _MockBlogRepository extends Mock implements BlogRepository {}

void main() {
  group('App', () {
    late BlogRepository blogRepository;

    setUp(() {
      blogRepository = _MockBlogRepository();
      when(blogRepository.getBlogPreviews)
          .thenAnswer((_) async => const BlogPreviews(previews: [], count: 0));
    });
    testWidgets('renders', (tester) async {
      await tester.pumpWidget(
        App(blogRepository: blogRepository),
      );
      expect(find.byType(BlogOverviewPage), findsOneWidget);
      expect(find.byType(Footer), findsOneWidget);
    });
  });
}
