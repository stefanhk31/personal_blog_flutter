import 'dart:convert';

import 'package:blog_html_builder/blog_html_builder.dart';
import 'package:blog_models/blog_models.dart';
import 'package:blog_repository/src/constants.dart';
import 'package:butter_cms_client/butter_cms_client.dart';

/// {@template rendered_api_data}
/// A tuple containing the status code of the API call
/// and the rendered HTML content.
/// {@endtemplate}
typedef RenderedContent = (int, String);

/// {@template blog_repository}
/// A repository for fetching blog data from the CMS
/// and generating HTML for the client.
/// {@endtemplate}
class BlogRepository {
  /// {@macro blog_repository}
  const BlogRepository({
    required ButterCmsClient cmsClient,
    required TemplateEngine templateEngine,
  })  : _cmsClient = cmsClient,
        _templateEngine = templateEngine;

  final ButterCmsClient _cmsClient;
  final TemplateEngine _templateEngine;

  /// Fetches a detailed blog post by [slug] and generates HTML for the client.
  Future<RenderedContent> getBlogDetailHtml(String slug) async {
    try {
      final response = await _cmsClient.fetchBlogPost(slug: slug);

      if (response.statusCode != 200) {
        return _renderErrorPage(
          message: 'Failed to fetch blog post: \n '
              'Status Code: ${response.statusCode} \n '
              'Body: ${response.body} ',
          statusCode: response.statusCode,
        );
      }

      final blogResponse = BlogResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );

      final blogDetail = BlogDetail.fromBlog(blogResponse.data);

      final html = await _templateEngine.render(
        filePath: 'blog_detail_page.html',
        context: {
          'title': blogDetail.title,
          'published': blogDetail.publishDateFormatted,
          'body': blogDetail.body,
          'authorName': blogDetail.authorName,
          'authorImage': blogDetail.author.profileImage,
          'featuredImage': blogDetail.featuredImage,
          'metaTitle': blogDetail.seoTitle,
          'metaDescription': blogDetail.metaDescription,
          'year': currentYear,
        },
      );
      return (200, html);
    } on Exception catch (e) {
      return _renderErrorPage(message: e.toString());
    }
  }

  Future<RenderedContent> _renderErrorPage({
    required String message,
    int statusCode = 500,
  }) async {
    final errorHtml = await _templateEngine.render(
      filePath: 'error_page.html',
      context: {
        'message': message,
      },
    );
    return (statusCode, errorHtml);
  }
}
