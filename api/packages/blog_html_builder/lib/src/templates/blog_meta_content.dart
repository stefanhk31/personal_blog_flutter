import 'package:blog_html_builder/src/templates/templates.dart';

class BlogMetaContent extends HtmlTemplate {
  const BlogMetaContent({
    required this.title,
    required this.description,
    this.imageUrl,
  });

  final String title;
  final String description;
  final String? imageUrl;

  @override
  String html() {
    return '''
        <title>$title</title>
        <meta charset="UTF-8">
        <meta content="IE=Edge" http-equiv="X-UA-Compatible">
        <meta name="description" content="$description">
        <meta property="og:title" content="$title">
        <meta property="og:description" content="$description">
        ${imageUrl != null ? '<meta property="og:image" content="$imageUrl">' : ''} 
    ''';
  }
}

const defaultMetaContent = BlogMetaContent(
  title: "Stefan's Post-Academic Chronicles",
  description: 'Exploring my post-academic experiences in software, '
      'the outdoors, and life in general.',
  imageUrl: 'https://example.com/image.jpg',
);
