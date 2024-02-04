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
            author: 'author',
            onTap: () {},
          ),
        );

        expect(find.byType(BlogCard), findsOneWidget);
      });

      testWidgets('with image and default tag', (tester) async {
        await tester.pumpMaterial(
          BlogCard(
            title: 'title',
            subtitle: 'subtitle',
            author: 'author',
            imageUrl: 'imageUrl',
            onTap: () {},
          ),
          mockNetworkImages: true,
        );

        expect(find.byType(BlogCard), findsOneWidget);
        final hero = find.byType(BlogCardHero);
        expect(hero, findsOneWidget);
        expect(tester.widget<BlogCardHero>(hero).tag, equals(defaultHeroTag));
      });

      testWidgets('with image and image tag', (tester) async {
        await tester.pumpMaterial(
          BlogCard(
            title: 'title',
            subtitle: 'subtitle',
            author: 'author',
            imageUrl: 'imageUrl',
            imageTag: 'imageTag',
            onTap: () {},
          ),
          mockNetworkImages: true,
        );

        expect(find.byType(BlogCard), findsOneWidget);
        final hero = find.byType(BlogCardHero);
        expect(hero, findsOneWidget);
        expect(tester.widget<BlogCardHero>(hero).tag, equals('imageTag'));
      });

      testWidgets('with author image', (tester) async {
        await tester.pumpMaterial(
          BlogCard(
            title: 'title',
            subtitle: 'subtitle',
            author: 'author',
            authorImage: 'authorImage',
            onTap: () {},
          ),
          mockNetworkImages: true,
        );

        expect(find.byType(BlogCard), findsOneWidget);
        expect(find.byType(AuthorAvatar), findsOneWidget);
      });
    });

    testWidgets('can be tapped', (tester) async {
      var tapped = false;
      await tester.pumpMaterial(
        BlogCard(
          title: 'title',
          subtitle: 'subtitle',
          author: 'author',
          onTap: () => tapped = true,
        ),
      );

      await tester.tap(find.byType(BlogCard));
      expect(tapped, isTrue);
    });
  });
}
