import 'package:blog_models/src/data_models/data_models.dart';
import 'package:equatable/equatable.dart';

/// {@template blog_response}
/// Data model for the API response containing a single blog post.
/// {@endtemplate}
class BlogResponse extends Equatable {
  /// {@macro blog_response}
  const BlogResponse({
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

  @override
  List<Object?> get props => [meta, data];

  /// Convert the BlogResponse object to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'meta': meta.toJson(),
      'data': data.toJson(),
    };
  }
}
