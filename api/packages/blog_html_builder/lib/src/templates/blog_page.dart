import 'package:blog_html_builder/src/templates/templates.dart';

/// {@template blog_page}
/// A class that generates the Html for a full page on the blog site.
/// {@endtemplate}
class BlogPage extends HtmlTemplate {
  /// {@macro blog_page}
  const BlogPage({
    required super.templateEngine,
  });

  @override
  Future<String> html() async {
    return templateEngine.render('blog_page.html');
  }
}
