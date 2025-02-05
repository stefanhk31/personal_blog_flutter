import 'package:blog_html_builder/src/templates/templates.dart';

class BlogDetailContent extends HtmlTemplate {
  final String authorName;
  final String body;
  final DateTime published;
  final String slug;
  final String title;
  final String? authorImage;
  final String? featuredImage;

  BlogDetailContent({
    required this.authorName,
    required this.body,
    required this.published,
    required this.slug,
    required this.title,
    this.authorImage,
    this.featuredImage,
  });

  @override
  String html() {
    return '''
    <!DOCTYPE html>
    <html>
      <head>
        <link href="/output.css" rel="stylesheet">
      </head>
      <body>
      <div class="bg-background-light dark:bg-background-dark">
        <article class="mx-auto prose text-text-light dark:text-text-dark">
          $body
        </article>
      </div>
      </body>
    </html>
    ''';
  }
}
