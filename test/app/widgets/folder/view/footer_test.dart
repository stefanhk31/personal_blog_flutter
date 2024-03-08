import 'package:bloc_test/bloc_test.dart';
import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_blog_flutter/app/widgets/widgets.dart';
import 'package:personal_blog_flutter/l10n/l10n.dart';

import '../../../../helpers/helpers.dart';

class _MockFooterBloc extends MockBloc<FooterEvent, FooterState>
    implements FooterBloc {}

void main() {
  group('Footer', () {
    testWidgets('renders', (tester) async {
      await tester.pumpApp(
        const Column(
          children: [
            Footer(),
          ],
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Footer), findsOneWidget);
    });

    group('FooterView', () {
      late FooterBloc footerBloc;

      setUp(() {
        footerBloc = _MockFooterBloc();
      });
      testWidgets('has correct asset when theme is light', (tester) async {
        await tester.pumpApp(
          Column(
            children: [
              BlocProvider.value(value: footerBloc, child: const FooterView()),
            ],
          ),
        );

        expect(
          assetImageFinder('assets/images/butter_cms_black.png'),
          findsOneWidget,
        );
      });

      testWidgets('has correct asset when theme is dark', (tester) async {
        await tester.pumpApp(
          Column(
            children: [
              BlocProvider.value(value: footerBloc, child: const FooterView()),
            ],
          ),
          theme: BlogTheme.darkThemeData,
        );

        expect(
          assetImageFinder('assets/images/butter_cms_white.png'),
          findsOneWidget,
        );
      });

      testWidgets('has correct text', (tester) async {
        await tester.pumpApp(
          Column(
            children: [
              BlocProvider.value(value: footerBloc, child: const FooterView()),
            ],
          ),
        );

        final context = tester.element(find.byType(FooterView));

        expect(
          find.text(context.l10n.copyrightText(DateTime.now().year)),
          findsOneWidget,
        );
      });

      group('clicking on link', () {
        testWidgets('emits FooterLinkClicked', (tester) async {
          await tester.pumpApp(
            Column(
              children: [
                BlocProvider.value(
                  value: footerBloc,
                  child: const FooterView(),
                ),
              ],
            ),
          );

          await tester.pumpAndSettle();

          await tester.tap(find.byType(GestureDetector));

          verify(
            () => footerBloc.add(
              const FooterLinkClicked(url: butterCmsLink),
            ),
          ).called(1);
        });
      });
    });
  });
}
