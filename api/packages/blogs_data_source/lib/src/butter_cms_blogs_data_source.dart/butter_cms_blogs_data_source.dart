import 'package:blog_models/blog_models.dart';
import 'package:blogs_data_source/blogs_data_source.dart';

/// Implementation of [BlogsDataSource] that uses ButterCMS as a backend.
class ButterCmsBlogsDataSource extends BlogsDataSource {
  @override
  Future<BlogResponse> getBlog(String slug) {
    // TODO: implement getBlog
    throw UnimplementedError();
  }

  @override
  Future<BlogsResponse> getBlogs() {
    // TODO: implement getBlogs
    throw UnimplementedError();
  }
}
