import 'package:blog_html_builder/blog_html_builder.dart';
import 'package:test/test.dart';

void main() {
  group('BlogPage', () {
    group('html', () {
      final innerHtml = BlogDetailContent(
        authorName: 'Author Name',
        title: 'Title',
        published: DateTime(2024),
        body: '<p>Body</p>',
      );

      test('returns a string with the inner html content', () {
        final blogPage = BlogPage(innerHtml: innerHtml);
        final result = blogPage.html();
        expect(result, contains(innerHtml.html()));
      });

      test('returns default meta content if none is provided', () {
        final blogPage = BlogPage(innerHtml: innerHtml);
        final result = blogPage.html();
        expect(result, contains(defaultMetaContent.html()));
      });

      test('returns provided meta content if provided', () {
        const metaContent = BlogMetaContent(
          title: 'Title',
          description: 'Description',
        );
        final blogPage = BlogPage(
          innerHtml: innerHtml,
          metaContent: metaContent,
        );
        final result = blogPage.html();
        expect(result, contains(metaContent.html()));
      });
    });
  });
}
