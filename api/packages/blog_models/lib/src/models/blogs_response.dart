import 'package:blog_models/src/models/models.dart';

/// Data model for the API response containing a list of blog posts.
class BlogsResponse {
  /// Default constructor for a list of bloc posts.
  BlogsResponse({
    required this.meta,
    required this.data,
  });

  /// Deserialize a Blogs list from a Map
  factory BlogsResponse.fromJson(Map<String, dynamic> json) {
    final list = json['data'] as List;
    final meta = BlogsMeta.fromJson(json['meta'] as Map<String, dynamic>);
    final data =
        list.map((i) => Blog.fromJson(i as Map<String, dynamic>)).toList();

    return BlogsResponse(
      meta: meta,
      data: data,
    );
  }

  /// Metadata for the list of blog posts
  final BlogsMeta meta;

  /// List of blog posts
  final List<Blog> data;

  /// Serialize a Blogs list to a Map
  Map<String, dynamic> toJson() {
    final meta = this.meta.toJson();
    final data = this.data.map((i) => i.toJson()).toList();

    return {
      'meta': meta,
      'data': data,
    };
  }
}
