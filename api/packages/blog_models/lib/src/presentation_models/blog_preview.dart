import 'package:blog_models/blog_models.dart';
import 'package:equatable/equatable.dart';

/// {@template blog_preview}
/// Represents a preview of a blog post.
/// {@endtemplate}
class BlogPreview extends Equatable {
  /// {@macro blog_preview}
  const BlogPreview({
    required this.title,
    required this.description,
    required this.published,
    required this.authorName,
    required this.slug,
    this.authorImage,
    this.image,
  });

  /// Creates a [BlogPreview] from the [Blog] data model.
  factory BlogPreview.fromBlog(Blog blog) => BlogPreview(
        title: blog.title,
        description: blog.summary,
        published: blog.published,
        authorName: '${blog.author.firstName} ${blog.author.lastName}',
        slug: blog.slug,
        authorImage: blog.author.profileImage,
        image: blog.featuredImage,
      );

  /// Title of the blog post.
  final String title;

  /// Short description of the blog post.
  final String description;

  /// Date of publication of the blog post.
  final DateTime published;

  /// Name of the blog post's author.
  final String authorName;

  /// Unique slug identifying the blog post.
  final String slug;

  /// Optional url of the author's image.
  final String? authorImage;

  /// Optional url of a preview image for the blog post.
  final String? image;

  @override
  List<Object?> get props => [
        title,
        description,
        published,
        authorName,
        slug,
        authorImage,
        image,
      ];
}
