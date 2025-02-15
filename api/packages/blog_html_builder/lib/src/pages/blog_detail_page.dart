import 'package:blog_html_builder/blog_html_builder.dart';
import 'package:blog_html_builder/src/constants.dart';
import 'package:blog_models/blog_models.dart';

/// {@template BlogDetailPage}
/// Data class for generating the HTML for a blog detail page.
/// {@endtemplate}
class BlogDetailPage extends HtmlPage {
  /// {@macro BlogDetailPage}
  BlogDetailPage({
    required this.blogDetail,
    this.metaTitle = defaultMetaTitle,
    this.metaDescription = defaultMetaDescription,
    this.metaImageUrl,
  });

  /// Blog detail data to be inserted into the HTML template.
  final BlogDetail blogDetail;

  /// Meta title to be inserted into the HTML template.
  final String metaTitle;

  /// Meta description to be inserted into the HTML template.
  final String metaDescription;

  /// Meta image URL to be inserted into the HTML template.
  final String? metaImageUrl;

  @override
  Future<String> html() async {
    return engine().render('/blog_detail_page.html');
  }

  @override
  TemplateEngine engine() => TemplateEngine(
        context: {
          'metaTitle': metaTitle,
          'metaDescription': metaDescription,
          'metaImageUrl': metaImageUrl,
          'title': blogDetail.title,
          'authorName': blogDetail.authorName,
          'body': blogDetail.body,
          'published': blogDetail.publishDateFormatted,
          'authorImage': blogDetail.author.profileImage,
          'featuredImage': blogDetail.featuredImage,
          'year': DateTime.now().year,
        },
        basePath: basePath,
      );
}
