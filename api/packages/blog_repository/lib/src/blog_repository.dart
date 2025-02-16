import 'dart:convert';

import 'package:blog_html_builder/blog_html_builder.dart';
import 'package:blog_models/blog_models.dart';
import 'package:butter_cms_client/butter_cms_client.dart';

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
  Future<String> getBlogDetailHtml(String slug) async {
    try {
      final response = await _cmsClient.fetchBlogPost(slug: slug);

      final blogResponse = BlogResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );

      final blogDetail = BlogDetail.fromBlog(blogResponse.data);

      final html = await _templateEngine.render(
        filePath: 'blog_detail.html',
        context: {
          'title': blogDetail.title,
          'published': blogDetail.publishDateFormatted,
          'body': blogDetail.body,
          'author': blogDetail.authorName,
          'tags': blogDetail.tags.map((tag) => tag.name).join(', '),
          'categories':
              blogDetail.categories.map((category) => category.name).join(', '),
          'featuredImage': blogDetail.featuredImage ?? '',
          'featuredImageAlt': blogDetail.featuredImageAlt ?? '',
          'seoTitle': blogDetail.seoTitle ?? '',
          'metaDescription': blogDetail.metaDescription ?? '',
          'url': blogDetail.url,
        },
      );
      return html;
    } on Exception catch (e) {
      final errorHtml = await _templateEngine.render(
        filePath: 'error.html',
        context: {
          'message': e.toString(),
        },
      );
      return errorHtml;
    }
  }
}
