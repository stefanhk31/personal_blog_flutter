import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_blog_flutter/app/widgets/widgets.dart';
import 'package:personal_blog_flutter/l10n/l10n.dart';

import '../../helpers/helpers.dart';

void main() {
  group('Footer', () {
    group('renders', () {
      testWidgets('with correct asset when theme is light', (tester) async {
        await tester.pumpApp(
          const Column(
            children: [
              Footer(),
            ],
          ),
        );

        expect(
          assetImageFinder('assets/images/butter_cms_black.png'),
          findsOneWidget,
        );
      });

      testWidgets('with correct asset when theme is dark', (tester) async {
        await tester.pumpApp(
          const Column(
            children: [
              Footer(),
            ],
          ),
          theme: BlogTheme.darkThemeData,
        );

        expect(
          assetImageFinder('assets/images/butter_cms_white.png'),
          findsOneWidget,
        );
      });

      testWidgets('with correct text', (tester) async {
        await tester.pumpApp(
          const Column(
            children: [
              Footer(),
            ],
          ),
        );

        final context = tester.element(find.byType(Footer));

        expect(
          find.text(context.l10n.copyrightText(DateTime.now().year)),
          findsOneWidget,
        );
      });
    });
  });
}
