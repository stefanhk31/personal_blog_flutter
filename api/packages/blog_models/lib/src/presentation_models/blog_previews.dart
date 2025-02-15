import 'package:blog_models/blog_models.dart';
import 'package:equatable/equatable.dart';

/// {@template blog_previews}
/// A list of blog post [previews] and the [count] number of blog posts.
/// {@endtemplate}
class BlogPreviews extends Equatable {
  /// {@macro blog_previews}
  const BlogPreviews({
    required this.previews,
    required this.count,
  });

  /// Factory to create [BlogPreviews] from the [BlogsResponse] data model
  /// using the [BlogPreview.fromBlog] factory and the count returned
  /// by the api.
  factory BlogPreviews.fromBlogs(BlogsResponse blogs) {
    return BlogPreviews(
      previews: blogs.data.map(BlogPreview.fromBlog).toList(),
      count: blogs.meta.count,
    );
  }

  /// List of blog post previews.
  final List<BlogPreview> previews;

  /// Total number of blog posts available.
  /// Used for requesting further data in pagination.
  final int count;

  @override
  List<Object?> get props => [previews, count];
}
