import 'package:blog_html_builder/src/templates/templates.dart';

/// {@template blog_meta_content}
/// A template to generate the HTML for the meta content of a blog page.
/// {@endtemplate}
class BlogMetaContent extends HtmlTemplate {
  /// {@macro blog_meta_content}
  const BlogMetaContent({
    required this.title,
    required this.description,
    this.imageUrl,
  });

  /// The meta title. Will be added to the <title> tag
  /// as well as the `og:title` meta tag.
  final String title;

  /// The meta description. Will be added to the `description` meta tag
  /// as well as the `og:description` meta tag.
  final String description;

  /// The URL of the image. Will be added to the `og:image` meta tag.
  final String? imageUrl;

  @override
  String html() {
    return '''
        <title>$title</title>
        <meta charset="UTF-8">
        <meta content="IE=Edge" http-equiv="X-UA-Compatible">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="$description">
        <meta property="og:title" content="$title">
        <meta property="og:description" content="$description">
        ${imageUrl != null ? '<meta property="og:image" content="$imageUrl">' : ''} 
    ''';
  }
}

/// The default meta content for the blog site.
/// Title and description are for the site as a whole,
/// not for individual blog posts.
const defaultMetaContent = BlogMetaContent(
  title: "Stefan's Post-Academic Chronicles",
  description: 'Exploring my post-academic experiences in software, '
      'the outdoors, and life in general.',
);
