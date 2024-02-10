import 'package:butter_cms_client/src/models/models.dart';

/// Data model for the API response containing a single blog post.
class BlogResponse {
  /// Default constructor for a single blog post.
  BlogResponse({
    required this.meta,
    required this.data,
  });

  /// Factory method to create a BlogResponse object from a JSON map.
  factory BlogResponse.fromJson(Map<String, dynamic> json) {
    return BlogResponse(
      meta: BlogMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: Blog.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  /// Metadata for the single blog post.
  final BlogMeta meta;

  /// Blog post contained in the Blog Response.
  final Blog data;

  /// Convert the BlogResponse object to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'meta': meta.toJson(),
      'data': data.toJson(),
    };
  }
}
