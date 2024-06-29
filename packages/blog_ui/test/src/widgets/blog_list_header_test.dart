import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helpers/pump_material.dart';

void main() {
  group('BlogListHeader', () {
    testWidgets('renders', (tester) async {
      await tester.pumpMaterial(
        CustomScrollView(
          slivers: [
            BlogListHeader(
              title: 'Title',
              background: Image.network('https://picsum.photos/200/300'),
            ),
          ],
        ),
        mockNetworkImages: true,
      );

      expect(find.byType(BlogListHeader), findsOneWidget);
    });
  });
}
