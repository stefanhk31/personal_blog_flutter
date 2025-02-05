import 'package:blog_html_builder/src/templates/blog_footer.dart';
import 'package:blog_html_builder/src/templates/templates.dart';

class BlogPage extends HtmlTemplate {
  final HtmlTemplate innerHtml;
  final BlogMetaContent? metaContent;

  BlogPage({
    required this.innerHtml,
    this.metaContent,
  });

  @override
  String html() {
    return '''
    <!DOCTYPE html>
    <html>
      <head>
        ${metaContent?.html() ?? defaultMetaContent.html()}
        <link href="/output.css" rel="stylesheet">
        <link rel="icon" type="image/png" href="favicon.png" />
        <link rel="manifest" href="manifest.json">
      </head>
      <body>
        <div class="bg-background-light dark:bg-background-dark">
          ${innerHtml.html()}
        </div>
      </body>
      ${const BlogFooter().html()}
    </html>
    ''';
  }
}
