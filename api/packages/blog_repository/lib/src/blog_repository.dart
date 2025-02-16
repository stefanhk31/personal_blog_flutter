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
  }) : _cmsClient = cmsClient;

  final ButterCmsClient _cmsClient;

  /// Fetches a detailed blog post by [slug] and generates HTML for the client.
  Future<String> getBlogDetailHtml(String slug) async {
    final response = await _cmsClient.fetchBlogPost(slug: slug);

    final blogResponse = BlogResponse.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );

    final blogDetail = BlogDetail.fromBlog(blogResponse.data);

    final html = await BlogDetailPage(
      blogDetail: blogDetail,
      metaTitle: blogDetail.seoTitle ?? defaultMetaTitle,
      metaDescription: blogDetail.metaDescription ?? defaultMetaDescription,
      metaImageUrl: blogDetail.featuredImage,
    ).html();

    return html;
  }
}
