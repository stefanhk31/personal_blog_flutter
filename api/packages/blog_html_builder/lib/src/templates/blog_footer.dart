import 'package:blog_html_builder/src/templates/templates.dart';

/// {@template blog_footer}
/// A class to generate the HTML content for the footer of the blog site.
/// {@endtemplate}
class BlogFooter extends HtmlTemplate {
  /// {@macro blog_footer}
  const BlogFooter({
    required super.templateEngine,
  });

  @override
  Future<String> html() async {
    return templateEngine.render('$basePath/blog_footer.html');
  }
}
