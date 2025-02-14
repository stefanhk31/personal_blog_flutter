import 'package:blog_html_builder/blog_html_builder.dart';
import 'package:blog_html_builder/src/templates/templates.dart';

/// {@template blog_detail_content}
/// A class to generate the HTML content for a blog post.
/// {@endtemplate}
class BlogDetailContent extends HtmlTemplate {
  /// {@macro blog_detail_content}
  const BlogDetailContent({
    required super.templateEngine,
  });
  @override
  Future<String> html() async {
    return templateEngine.render('blog_detail_content.html');
  }
}
