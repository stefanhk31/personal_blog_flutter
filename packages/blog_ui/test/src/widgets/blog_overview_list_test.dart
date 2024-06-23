import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_material.dart';

void main() {
  group('BlogOverviewList', () {
    Widget itemBuilder(BuildContext context, int index) => Text('item $index');
    testWidgets('renders', (tester) async {
      await tester.pumpMaterial(
        BlogOverviewList(
          itemCount: 10,
          itemBuilder: itemBuilder,
          onFetchData: () {},
        ),
      );

      expect(find.byType(BlogOverviewList), findsOneWidget);
    });

    testWidgets('renders with header', (tester) async {
      await tester.pumpMaterial(
        BlogOverviewList(
          itemCount: 10,
          itemBuilder: itemBuilder,
          onFetchData: () {},
          header: const Text('Header'),
        ),
      );

      expect(find.byType(BlogOverviewList), findsOneWidget);
      expect(
        find.descendant(
            of: find.byType(SliverAppBar), matching: find.text('Header')),
        findsOneWidget,
      );
    });

    testWidgets('renders loader widget when isLoading is true', (tester) async {
      await tester.pumpMaterial(
        BlogOverviewList(
          itemCount: 10,
          itemBuilder: itemBuilder,
          onFetchData: () {},
          isLoading: true,
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('calls onFetchData on scroll to end', (tester) async {
      var fetched = false;
      await tester.pumpMaterial(
        BlogOverviewList(
          itemCount: 50,
          itemBuilder: itemBuilder,
          onFetchData: () {
            fetched = true;
          },
        ),
      );

      await tester.scrollUntilVisible(
        find.text('item 49'),
        100,
        scrollable: find.byType(Scrollable),
      );
      await tester.pumpAndSettle();

      expect(fetched, isTrue);
    });
  });
}
