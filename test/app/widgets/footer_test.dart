import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_blog_flutter/app/bloc/app_bloc.dart';
import 'package:personal_blog_flutter/app/widgets/widgets.dart';
import 'package:personal_blog_flutter/l10n/l10n.dart';

import '../../helpers/helpers.dart';

class _MockAppBloc extends Mock implements AppBloc {}

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

      testWidgets('with tappable link', (tester) async {
        var tapped = false;
        void onTap() => tapped = true;

        await tester.pumpApp(
          Column(
            children: [
              Footer(
                onTap: onTap,
              ),
            ],
          ),
        );

        await tester.press(find.byType(GestureDetector));
        await tester.pumpAndSettle();
        expect(tapped, isTrue);
      });
    });

    group('clicking on link', () {
      late AppBloc appBloc;

      setUp(() {
        appBloc = _MockAppBloc();
        when(() => appBloc.state).thenReturn(AppInitial());
      });

      testWidgets('emits FooterLinkClicked', (tester) async {
        await tester.pumpApp(
          BlocProvider(
            create: (context) => appBloc,
            child: const Column(
              children: [
                Footer(),
              ],
            ),
          ),
        );

        expect(find.byType(GestureDetector), findsOneWidget);

        await tester.tap(find.byType(GestureDetector));

        await tester.pumpAndSettle(const Duration(seconds: 1));

        verify(() => appBloc.add(const FooterLinkClicked(url: butterCmsLink)))
            .called(1);
      });
    });
  });
}
