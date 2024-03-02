import 'package:equatable/equatable.dart';

/// Represents a summary of a blog.
class BlogSummary extends Equatable {
  /// Default constructor for a blog summary.
  BlogSummary({
    required this.slug,
    required this.title,
    required this.featuredImage,
  });

  /// Factory method to create a BlogSummary instance from a JSON map.
  factory BlogSummary.fromJson(Map<String, dynamic> json) {
    return BlogSummary(
      slug: json['slug'] as String,
      title: json['title'] as String,
      featuredImage: json['featured_image'] as String,
    );
  }

  /// Unique slug of the blog summary.
  final String slug;

  /// Title of the blog post.
  final String title;

  /// Featured image of the blog post.
  final String featuredImage;

  @override
  List<Object?> get props => [slug, title, featuredImage];

  /// Converts the BlogSummary instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'slug': slug,
      'title': title,
      'featured_image': featuredImage,
    };
  }
}
