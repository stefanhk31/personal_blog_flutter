import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:equatable/equatable.dart';

/// Represents a preview of a blog post.
class BlogPreview extends Equatable {
  /// Default constructor for a blog preview.
  const BlogPreview({
    required this.title,
    required this.description,
    required this.published,
    required this.authorName,
    required this.slug,
    this.authorImage,
    this.image,
  });

  /// Creates a [BlogPreview] from the Butter CMS [Blog] model.
  factory BlogPreview.fromButter(Blog blog) => BlogPreview(
        title: blog.title,
        description: blog.summary,
        published: blog.published,
        authorName: '${blog.author.firstName} ${blog.author.lastName}',
        slug: 'slug',
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
