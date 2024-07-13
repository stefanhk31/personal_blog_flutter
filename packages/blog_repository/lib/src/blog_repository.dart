import 'package:blog_api_client/blog_api_client.dart';
import 'package:blog_models/blog_models.dart';

/// {@template blog_repository}
/// Repository to process blog data retrieved from the API.
/// {@endtemplate}
class BlogRepository {
  /// {@macro blog_repository}
  BlogRepository({required BlogApi blogApi}) : _blogApi = blogApi;

  final BlogApi _blogApi;

  /// Gets a list of [BlogPreview] objects.
  ///
  /// [limit] is the maximum number of previews to fetch from the API.
  /// [offset] is the number of previews to skip on an API call, and is
  /// used for pagination.
  Future<BlogPreviews> getBlogPreviews({
    int limit = defaultRequestLimit,
    int offset = defaultRequestOffset,
  }) async {
    final request = BlogsRequest(
      limit: limit,
      offset: offset,
    );

    final response = await _blogApi.getBlogs(request);
    return BlogPreviews.fromBlogs(response);
  }

  /// Gets a single [BlogDetail] object given a unique [slug].
  Future<BlogDetail> getBlogDetail({required String slug}) async {
    final response = await _blogApi.getBlog(slug);
    return BlogDetail.fromBlog(response.data);
  }
}
