import 'package:butter_cms_client/src/models/blog.dart';
import 'package:butter_cms_client/src/models/meta.dart';

/// Data model for a list of blog posts.
class Blogs {
  /// Default constructor for a list of bloc posts.
  Blogs({
    required this.meta,
    required this.data,
  });

  /// Deserialize a Blogs list from a Map
  factory Blogs.fromJson(Map<String, dynamic> json) {
    final list = json['data'] as List;
    final meta = Meta.fromJson(json['meta'] as Map<String, dynamic>);
    final data =
        list.map((i) => Blog.fromJson(i as Map<String, dynamic>)).toList();

    return Blogs(
      meta: meta,
      data: data,
    );
  }

  /// Metadata for the list of blog posts
  final Meta meta;

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
