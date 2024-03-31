import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_summary.g.dart';

/// {@template blog_summary}
/// Represents a summary of a blog.
/// {@endtemplate}
@JsonSerializable()
class BlogSummary extends Equatable {
  /// {@macro blog_summary}
  const BlogSummary({
    required this.slug,
    required this.title,
    required this.featuredImage,
  });

  /// Factory method to create a BlogSummary instance from a JSON map.
  factory BlogSummary.fromJson(Map<String, dynamic> json) =>
      _$BlogSummaryFromJson(json);

  /// Converts the BlogSummary instance to a JSON map.
  Map<String, dynamic> toJson() => _$BlogSummaryToJson(this);

  /// Unique slug of the blog summary.
  final String slug;

  /// Title of the blog post.
  final String title;

  /// Featured image of the blog post.
  final String featuredImage;

  @override
  List<Object?> get props => [slug, title, featuredImage];
}
