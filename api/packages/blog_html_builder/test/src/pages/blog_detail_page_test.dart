import 'package:blog_html_builder/blog_html_builder.dart';
import 'package:blog_models/blog_models.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockTemplateEngine extends Mock implements TemplateEngine {}

void main() {
  group('BlogPage', () {
    late TemplateEngine templateEngine;
    late BlogDetailPage blogDetailPage;

    setUp(() {
      templateEngine = _MockTemplateEngine();
      blogDetailPage = BlogDetailPage(blogDetail: BlogDetail.fromBlog(blog));

      when(() => templateEngine.render('blog_detail_page.html'))
          .thenAnswer((_) async => '<html></html>');
    });

    group('engine', () {
      test('returns a template engine with the appropriate context', () {
        final engine = blogDetailPage.engine();
        expect(
          engine.context,
          containsPair('title', blogDetailPage.blogDetail.title),
        );
        expect(
          engine.context,
          containsPair(
            'authorName',
            blogDetailPage.blogDetail.authorName,
          ),
        );
        expect(
          engine.context,
          containsPair(
            'body',
            blogDetailPage.blogDetail.body,
          ),
        );
        expect(
          engine.context,
          containsPair(
            'published',
            blogDetailPage.blogDetail.publishDateFormatted,
          ),
        );
        expect(
          engine.context,
          containsPair(
            'authorImage',
            blogDetailPage.blogDetail.author.profileImage,
          ),
        );
        expect(
          engine.context,
          containsPair(
            'featuredImage',
            blogDetailPage.blogDetail.featuredImage,
          ),
        );
      });
    });

    group('html', () {
      test('calls on template engine to render string', () async {
        await blogDetailPage.html();
        verify(() => templateEngine.render('blog_detail_page.html')).called(1);
      });
    });
  });
}
