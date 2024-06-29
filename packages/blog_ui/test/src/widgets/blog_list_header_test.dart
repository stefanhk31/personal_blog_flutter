import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helpers/pump_material.dart';

void main() {
  group('BlogListHeader', () {
    testWidgets('renders', (tester) async {
      await tester.pumpMaterial(
        BlogListHeader(
          title: 'Title',
          background: Image.asset(''),
        ),
      );

      expect(find.byType(BlogListHeader), findsOneWidget);
    });
  });
}
