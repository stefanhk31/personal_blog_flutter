import 'package:blog_html_builder/blog_html_builder.dart';
import 'package:test/test.dart';

void main() {
  group('BlogMetaContent', () {
    const title = 'Test Title';
    const description = 'Test Description';
    group('html', () {
      test('returns a string with the title and description', () {
        const blogMetaContent = BlogMetaContent(
          title: title,
          description: description,
        );
        final result = blogMetaContent.html();
        expect(result, contains(title));
        expect(result, contains(description));
      });

      test('returns a string with the imageUrl if provided', () {
        const imageUrl = 'https://example.com/image.png';
        const blogMetaContent = BlogMetaContent(
          title: title,
          description: description,
          imageUrl: imageUrl,
        );
        final result = blogMetaContent.html();
        expect(result, contains(imageUrl));
      });
    });
  });
}
