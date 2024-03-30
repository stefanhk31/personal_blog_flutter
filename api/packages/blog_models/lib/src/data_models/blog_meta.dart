import 'package:blog_models/src/data_models/data_models.dart';
import 'package:equatable/equatable.dart';

/// {@template blog_meta}
/// Data class representing metadata for a single blog post.
/// {@endtemplate}
class BlogMeta extends Equatable {
  /// {@macro blog_meta}
  const BlogMeta({
    this.nextPost,
    this.previousPost,
  });

  /// Factory method to create a BlogMeta instance from a JSON map.
  factory BlogMeta.fromJson(Map<String, dynamic> json) {
    return BlogMeta(
      nextPost: json['next_post'] != null
          ? BlogSummary.fromJson(json['next_post'] as Map<String, dynamic>)
          : null,
      previousPost: json['previous_post'] != null
          ? BlogSummary.fromJson(json['previous_post'] as Map<String, dynamic>)
          : null,
    );
  }

  /// Optional next post in the blog series.
  final BlogSummary? nextPost;

  /// Optional previous post in the blog series.
  final BlogSummary? previousPost;

  @override
  List<Object?> get props => [nextPost, previousPost];

  /// Converts the BlogMeta instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'next_post': nextPost?.toJson(),
      'previous_post': previousPost?.toJson(),
    };
  }
}
