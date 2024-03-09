import 'package:blog_ui/blog_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_material.dart';

void main() {
  group('BlogCard', () {
    group('renders', () {
      testWidgets('without any image', (tester) async {
        await tester.pumpMaterial(
          BlogCard(
            title: 'title',
            subtitle: 'subtitle',
            published: DateTime.now(),
            onTap: () {},
          ),
        );

        expect(find.byType(BlogCard), findsOneWidget);
      });

      testWidgets('with correct date format', (tester) async {
        final date = DateTime(2024);
        await tester.pumpMaterial(
          BlogCard(
            title: 'title',
            subtitle: 'subtitle',
            published: date,
            onTap: () {},
          ),
        );

        expect(find.text('January 1, 2024'), findsOneWidget);
      });

      testWidgets('with image', (tester) async {
        await tester.pumpMaterial(
          BlogCard(
            title: 'title',
            subtitle: 'subtitle',
            published: DateTime.now(),
            imageUrl: 'imageUrl',
            onTap: () {},
          ),
          mockNetworkImages: true,
        );

        expect(find.byType(BlogCard), findsOneWidget);
        expect(find.byType(FeaturedImage), findsOneWidget);
      });

      testWidgets('with image and image tag', (tester) async {
        await tester.pumpMaterial(
          BlogCard(
            title: 'title',
            subtitle: 'subtitle',
            published: DateTime.now(),
            imageUrl: 'imageUrl',
            imageTag: 'imageTag',
            onTap: () {},
          ),
          mockNetworkImages: true,
        );

        expect(find.byType(BlogCard), findsOneWidget);
        final image = find.byType(FeaturedImage);
        expect(image, findsOneWidget);
        expect(
          tester.widget<FeaturedImage>(image).imageTag,
          equals('imageTag'),
        );
      });
    });

    testWidgets('can be tapped', (tester) async {
      var tapped = false;
      await tester.pumpMaterial(
        BlogCard(
          title: 'title',
          subtitle: 'subtitle',
          published: DateTime.now(),
          onTap: () => tapped = true,
        ),
      );

      await tester.tap(find.byType(BlogCard));
      expect(tapped, isTrue);
    });
  });
}
