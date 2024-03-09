import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_material.dart';

void main() {
  group('FeaturedImage', () {
    group('renders', () {
      testWidgets('with only an image url', (tester) async {
        await tester.pumpMaterial(
          const FeaturedImage(
            imageUrl: 'imageUrl',
          ),
          mockNetworkImages: true,
        );

        expect(find.byType(FeaturedImage), findsOneWidget);
      });

      testWidgets('with imageTag', (tester) async {
        await tester.pumpMaterial(
          const FeaturedImage(
            imageUrl: 'imageUrl',
            imageTag: 'imageTag',
          ),
          mockNetworkImages: true,
        );

        final image = find.byType(FeaturedImage);
        expect(image, findsOneWidget);
        expect(
          tester.widget<FeaturedImage>(image).imageTag,
          equals('imageTag'),
        );
      });

      testWidgets('with constraints', (tester) async {
        const constraints = BoxConstraints(
          maxHeight: 200,
        );

        await tester.pumpMaterial(
          const FeaturedImage(
            imageUrl: 'imageUrl',
            imageTag: 'imageTag',
            constraints: constraints,
          ),
          mockNetworkImages: true,
        );

        final image = find.byType(FeaturedImage);
        expect(image, findsOneWidget);
        expect(
          tester.widget<FeaturedImage>(image).constraints,
          equals(constraints),
        );
      });
    });
  });
}
