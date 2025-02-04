import 'package:blog_models/blog_models.dart';

abstract class HtmlTemplate {
  String html();
}

class BlogPage extends HtmlTemplate {
  final HtmlTemplate innerHtml;

  BlogPage({required this.innerHtml});

  @override
  String html() {
    //TODO: add footer
    return '''
    <!DOCTYPE html>
    <html>
      <head>
        <link href="/output.css" rel="stylesheet">
      </head>
      <body>
        <div class="bg-background-light dark:bg-background-dark">
          ${innerHtml.html()}
        </div>
      </body>
    </html>
    ''';
  }
}

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

String makeBlogDetailPage(BlogDetail blog) {
  final content = BlogDetailContent(
    authorName: '${blog.author.firstName} ${blog.author.lastName}',
    body: blog.body,
    published: blog.published,
    slug: blog.slug,
    title: blog.title,
    authorImage: blog.author.profileImage,
    featuredImage: blog.featuredImage,
  );

  final page = BlogPage(innerHtml: content);

  return page.html();
}
