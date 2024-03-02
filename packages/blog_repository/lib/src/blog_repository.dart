import 'package:blog_api_client/blog_api_client.dart';
import 'package:blog_repository/blog_repository.dart';

/// {@template blog_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class BlogRepository {
  /// {@macro blog_repository}
  BlogRepository({required BlogApi blogApi}) : _blogApi = blogApi;

  final BlogApi _blogApi;

  /// Gets a list of [BlogPreview] objects.
  Future<List<BlogPreview>> getBlogPreviews() async {
    final response = await _blogApi.getBlogs();
    return response.data.map(BlogPreview.fromApi).toList();
  }

  /// Gets a single [BlogDetail] object given a unique [slug].
  Future<BlogDetail> getBlogDetail({required String slug}) async {
    final response = await _blogApi.getBlog(slug);
    return BlogDetail.fromApi(response.data);
  }
}
