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

class _MockFooterCubit extends MockCubit<FooterState> implements FooterCubit {}

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
      late FooterCubit footerCubit;

      setUp(() {
        footerCubit = _MockFooterCubit();
      });
      testWidgets('has correct asset when theme is light', (tester) async {
        await tester.pumpApp(
          Column(
            children: [
              BlocProvider.value(value: footerCubit, child: const FooterView()),
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
              BlocProvider.value(value: footerCubit, child: const FooterView()),
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
              BlocProvider.value(value: footerCubit, child: const FooterView()),
            ],
          ),
        );

        final context = tester.element(find.byType(FooterView));

        expect(
          find.text(context.l10n.copyrightText(DateTime.now().year)),
          findsOneWidget,
        );
      });

      testWidgets('clicking on link calls launchFooterLink', (tester) async {
        when(
          () => footerCubit.launchFooterLink(butterCmsLink),
        ).thenAnswer((_) async => {});

        await tester.pumpApp(
          Column(
            children: [
              BlocProvider.value(
                value: footerCubit,
                child: const FooterView(),
              ),
            ],
          ),
        );

        await tester.pumpAndSettle();

        await tester.tap(find.byType(GestureDetector));

        verify(
          () => footerCubit.launchFooterLink(butterCmsLink),
        ).called(1);
      });
    });
  });
}
