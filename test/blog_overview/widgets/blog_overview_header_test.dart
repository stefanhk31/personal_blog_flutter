import 'package:flutter_test/flutter_test.dart';
import 'package:personal_blog_flutter/blog_overview/widgets/widgets.dart';
import 'package:personal_blog_flutter/l10n/l10n.dart';

import '../../helpers/helpers.dart';

void main() {
  group('BlogOverviewHeader', () {
    testWidgets('renders', (tester) async {
      await tester.pumpApp(
        const BlogOverviewHeader(),
      );

      expect(find.byType(BlogOverviewHeader), findsOneWidget);
    });

    testWidgets('displays correct text', (tester) async {
      await tester.pumpApp(
        const BlogOverviewHeader(),
      );

      final context = tester.element(find.byType(BlogOverviewHeader));
      expect(
        find.text(context.l10n.blogOverviewHeader.toUpperCase()),
        findsOneWidget,
      );
      expect(
        find.text(context.l10n.blogOverviewHeaderSubtitle),
        findsOneWidget,
      );
    });
  });
}
