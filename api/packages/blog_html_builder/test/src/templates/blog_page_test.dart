import 'package:blog_html_builder/blog_html_builder.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockTemplateEngine extends Mock implements TemplateEngine {}

void main() {
  group('BlogPage', () {
    late TemplateEngine templateEngine;
    late BlogPage blogPage;

    setUp(() {
      templateEngine = _MockTemplateEngine();
      blogPage = BlogPage(
        templateEngine: templateEngine,
      );

      when(() => templateEngine.render('blog_page.html'))
          .thenAnswer((_) async => '<html></html>');
    });
    group('html', () {
      test('calls on template engine to render string', () async {
        await blogPage.html();
        verify(() => templateEngine.render('blog_page.html')).called(1);
      });
    });
  });
}
