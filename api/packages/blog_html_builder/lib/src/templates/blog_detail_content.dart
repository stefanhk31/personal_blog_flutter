import 'package:blog_html_builder/src/templates/templates.dart';
import 'package:intl/intl.dart';

/// {@template blog_detail_content}
/// A class to generate the HTML content for a blog post.
/// {@endtemplate}
class BlogDetailContent extends HtmlTemplate {
  /// {@macro blog_detail_content}
  const BlogDetailContent({
    required this.authorName,
    required this.body,
    required this.published,
    required this.title,
    this.authorImage,
    this.featuredImage,
  });

  /// The full name of the author of the blog post.
  final String authorName;

  /// The body content of the blog post, in stringified HTML format.
  final String body;

  /// The date and time the blog post was published.
  final DateTime published;

  /// The title of the blog post.
  final String title;

  /// The URL of the author's profile image.
  final String? authorImage;

  /// The URL of the featured image of the blog post.
  final String? featuredImage;

  @override
  String html() {
    return '''
    <article class="mx-auto prose text-text-light dark:text-text-dark">
      ${featuredImage != null ? '<img src="$featuredImage" alt="$title" class="w-full h-96 object-cover object-center">' : ''}
      <header>
        <h1 class="text-4xl font-bold">$title</h1>
        <div class = "flex justify-start">
          ${authorImage != null ? '<img src="$authorImage" alt="$authorName" class="w-12 h-12 rounded-full object-cover object-center">' : ''}
          <p class="text-sm text-text-light dark:text-text-dark">
            By $authorName on ${DateFormat.yMMMMd().format(published)}
          </p>
      </header>
      $body
    </article>
    ''';
  }
}
