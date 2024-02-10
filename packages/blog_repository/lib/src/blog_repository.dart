import 'package:blog_repository/blog_repository.dart';
import 'package:butter_cms_client/butter_cms_client.dart';

/// {@template blog_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class BlogRepository {
  /// {@macro blog_repository}
  BlogRepository({required ButterCmsClient butterCmsClient})
      : _butterCmsClient = butterCmsClient;

  final ButterCmsClient _butterCmsClient;

  /// Gets a list of [BlogPreview] objects.
  Future<List<BlogPreview>> getBlogPreviews() async {
    try {
      final response = await _butterCmsClient.fetchBlogPosts(excludeBody: true);
      return response.data.map(BlogPreview.fromButter).toList();
    } on Exception {
      rethrow;
    }
  }

  /// Gets a single [BlogDetail] object given a unique [slug].
  Future<BlogDetail> getBlogDetail({required String slug}) async {
    try {
      final response = await _butterCmsClient.fetchBlogPost(slug: slug);
      return BlogDetail.fromButter(response.data);
    } on Exception {
      rethrow;
    }
  }
}
