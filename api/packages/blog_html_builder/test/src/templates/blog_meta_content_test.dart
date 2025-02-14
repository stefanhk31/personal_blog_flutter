import 'package:blog_html_builder/blog_html_builder.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockTemplateEngine extends Mock implements TemplateEngine {}

void main() {
  group('BlogMetaContent', () {
    late TemplateEngine templateEngine;
    late BlogMetaContent blogMetaContent;

    setUp(() {
      templateEngine = _MockTemplateEngine();
      blogMetaContent = BlogMetaContent(
        templateEngine: templateEngine,
      );

      when(() => templateEngine.render('blog_meta_content.html'))
          .thenAnswer((_) async => '<meta></meta>');
    });
    group('html', () {
      test('calls on template engine to render string', () async {
        await blogMetaContent.html();
        verify(() => templateEngine.render('blog_meta_content.html')).called(1);
      });
    });
  });
}
