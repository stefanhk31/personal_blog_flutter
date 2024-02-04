import 'package:blog_ui/blog_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_material.dart';

void main() {
  group('BlogCardHero', () {
    testWidgets('renders', (tester) async {
      await tester.pumpMaterial(
        const BlogCardHero(
          tag: 'tag',
          imageUrl: 'imageUrl',
        ),
        mockNetworkImages: true,
      );
    });
  });
}
