import 'package:blog_repository/src/models/blog_post.dart';
import 'package:butter_cms_client/butter_cms_client.dart';

/// {@template blog_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class BlogRepository {
  /// {@macro blog_repository}
  BlogRepository({required ButterCmsClient butterCmsClient})
      : _butterCmsClient = butterCmsClient;

  final ButterCmsClient _butterCmsClient;

  /// Gets a list of [BlogPost] objects.
  Future<List<BlogPost>> getBlogPosts() async {
    try {
      final blogs = await _butterCmsClient.fetchBlogPosts();
      return blogs.data.map(BlogPost.fromButter).toList();
    } on Exception {
      rethrow;
    }
  }
}
