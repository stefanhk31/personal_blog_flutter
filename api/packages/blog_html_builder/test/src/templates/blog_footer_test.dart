import 'package:blog_html_builder/blog_html_builder.dart';
import 'package:test/test.dart';

void main() {
  group('BlogFooter', () {
    group('html', () {
      test('returns a string with the blog footer content', () {
        const blogFooter = BlogFooter();
        final result = blogFooter.html();
        expect(result, contains('<footer'));
      });
    });
  });
}
