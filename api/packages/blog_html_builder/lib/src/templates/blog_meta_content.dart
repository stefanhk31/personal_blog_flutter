import 'package:blog_html_builder/src/templates/templates.dart';

/// {@template blog_meta_content}
/// A template to generate the HTML for the meta content of a blog page.
/// {@endtemplate}
class BlogMetaContent extends HtmlTemplate {
  /// {@macro blog_meta_content}
  const BlogMetaContent({
    required super.templateEngine,
  });

  @override
  Future<String> html() async {
    return templateEngine.render('$basePath/blog_meta_content.html');
  }
}

/// The default meta title for the blog site. Reflects the entire site content,
/// not the content of an individual post.
const defaultMetaTitle = "Stefan's Post-Academic Chronicles";

/// The default meta description for the blog site. Reflects the entire site
/// content, not the content of an individual post.
const defaultMetaDescription = 'Exploring my post-academic experiences '
    'in software, the outdoors, and life in general.';
