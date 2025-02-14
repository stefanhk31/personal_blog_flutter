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

    return '''
    <!DOCTYPE html>
    <html>
      <head>
        ${metaContent?.html() ?? defaultMetaContent.html()}
        <link href="/output.css" rel="stylesheet">
        <link rel="icon" type="image/png" href="/favicon.png" />
        <link rel="manifest" href="/manifest.json">
      </head>
      <body>
        <div class="mx-auto bg-background-light dark:bg-background-dark">
          ${innerHtml.html()}
        </div>
      </body>
      ${const BlogFooter().html()}
    </html>
    ''';
  }
}
