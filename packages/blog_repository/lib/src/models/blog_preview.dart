import 'package:equatable/equatable.dart';

/// Represents a preview of a blog post.
class BlogPreview extends Equatable {
  /// Default constructor for a blog preview.
  const BlogPreview({
    required this.title,
    required this.description,
    required this.published, // Added missing property
    required this.authorName, // Added missing property
    this.authorImage, // Added missing property
    this.image, // Added missing property
  });

  /// Title of the blog post.
  final String title;

  /// Short description of the blog post.
  final String description;

  /// Date of publication of the blog post.
  final DateTime published;

  /// Name of the blog post's author.
  final String authorName;

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
        authorImage,
        image,
      ];
}
