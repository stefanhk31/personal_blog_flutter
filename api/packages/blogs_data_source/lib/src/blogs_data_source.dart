import 'package:blog_models/blog_models.dart';

/// {@template blogs_data_source}
/// Abstract interface for a data source that provides blog data.
/// {@endtemplate}
abstract class BlogsDataSource {
  /// Fetches all available blog posts.
  Future<BlogsResponse> getBlogs();

  /// Fetch an individual blog post by its unique [slug].
  Future<BlogResponse> getBlog(String slug);
}
