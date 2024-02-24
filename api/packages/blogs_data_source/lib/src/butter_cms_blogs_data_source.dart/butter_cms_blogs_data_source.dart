import 'package:blog_models/blog_models.dart';
import 'package:blogs_data_source/blogs_data_source.dart';
import 'package:butter_cms_client/butter_cms_client.dart';

/// Implementation of [BlogsDataSource] that uses ButterCMS as a backend.
class ButterCmsBlogsDataSource extends BlogsDataSource {
  /// Default constructor for a [ButterCmsBlogsDataSource].
  ButterCmsBlogsDataSource({required ButterCmsClient client})
      : _client = client;

  final ButterCmsClient _client;

  @override
  Future<BlogResponse> getBlog(String slug) async =>
      _client.fetchBlogPost(slug: slug);

  @override
  Future<BlogsResponse> getBlogs() async => _client.fetchBlogPosts();
}
