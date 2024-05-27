import 'package:blog_ui/blog_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_material.dart';

void main() {
  group('BlogDetailContent', () {
    const authorName = 'John Doe';
    const body = 'This is a blog post.';
    const slug = 'example-post';
    const title = 'Example Post';

    testWidgets('renders', (tester) async {
      await tester.pumpMaterial(
        BlogDetailContent(
          authorName: authorName,
          body: body,
          published: DateTime.now(),
          slug: slug,
          title: title,
        ),
      );

      expect(find.byType(BlogDetailContent), findsOneWidget);
    });

    testWidgets('renders with featured image', (tester) async {
      await tester.pumpMaterial(
        BlogDetailContent(
          authorName: authorName,
          body: body,
          published: DateTime.now(),
          slug: slug,
          title: title,
          featuredImage: 'https://example.com/image.jpg',
        ),
        mockNetworkImages: true,
      );

      expect(find.byType(BlogDetailContent), findsOneWidget);
      expect(find.byType(FeaturedImage), findsOneWidget);
    });

    testWidgets('calls onLinkTap', (tester) async {
      const testLink = 'https://example.com';
      String? tappedLink;

      await tester.pumpMaterial(
        BlogDetailContent(
          authorName: authorName,
          body: body,
          published: DateTime.now(),
          slug: slug,
          title: title,
          onTapUrl: (link) {
            tappedLink = link;
            return true;
          },
        ),
      );

      final widget =
          tester.widget<BlogDetailContent>(find.byType(BlogDetailContent));

      widget.onTapUrl?.call(testLink);

      expect(tappedLink, equals(testLink));
    });
  });
}
