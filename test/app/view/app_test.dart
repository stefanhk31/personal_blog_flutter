import 'package:blog_repository/blog_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_blog_flutter/app/app.dart';
import 'package:personal_blog_flutter/blog_overview/view/blog_overview.dart';

class _MockBlogRepository extends Mock implements BlogRepository {}

void main() {
  group('App', () {
    testWidgets('renders BlogOverview', (tester) async {
      await tester.pumpWidget(App(blogRepository: _MockBlogRepository()));
      expect(find.byType(BlogOverview), findsOneWidget);
    });
  });
}
