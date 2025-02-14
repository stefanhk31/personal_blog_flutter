import 'package:blog_html_builder/blog_html_builder.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockTemplateEngine extends Mock implements TemplateEngine {}

void main() {
  group('BlogFooter', () {
    late TemplateEngine templateEngine;
    late BlogFooter blogFooter;

    setUp(() {
      templateEngine = _MockTemplateEngine();
      blogFooter = BlogFooter(
        templateEngine: templateEngine,
      );

      when(() => templateEngine.render('blog_footer.html'))
          .thenAnswer((_) async => '<footer></footer>');
    });

    group('html', () {
      test('calls on template engine to render string', () async {
        await blogFooter.html();
        verify(() => templateEngine.render('blog_footer.html')).called(1);
      });
    });
  });
}
