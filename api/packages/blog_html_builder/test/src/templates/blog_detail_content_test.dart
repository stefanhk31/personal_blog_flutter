import 'package:blog_html_builder/blog_html_builder.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockTemplateEngine extends Mock implements TemplateEngine {}

void main() {
  group('BlogDetailContent', () {
    late TemplateEngine templateEngine;
    late BlogDetailContent blogDetailContent;

    setUp(() {
      templateEngine = _MockTemplateEngine();
      blogDetailContent = BlogDetailContent(
        templateEngine: templateEngine,
      );

      when(() => templateEngine.render('blog_detail_content.html'))
          .thenAnswer((_) async => '<html></html>');
    });

    group('html', () {
      test('calls on template engine to render string', () async {
        await blogDetailContent.html();
        verify(() => templateEngine.render('blog_detail_content.html'))
            .called(1);
      });
    });
  });
}
