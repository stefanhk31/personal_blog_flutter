import 'package:blog_models/src/data_models/data_models.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_meta.g.dart';

/// {@template blog_meta}
/// Data class representing metadata for a single blog post.
/// {@endtemplate}
@JsonSerializable()
class BlogMeta extends Equatable {
  /// {@macro blog_meta}
  const BlogMeta({
    this.nextPost,
    this.previousPost,
  });

  /// Factory method to create a BlogMeta instance from a JSON map.
  factory BlogMeta.fromJson(Map<String, dynamic> json) =>
      _$BlogMetaFromJson(json);

  /// Converts the BlogMeta instance to a JSON map.
  Map<String, dynamic> toJson() => _$BlogMetaToJson(this);

  /// Optional next post in the blog series.
  final BlogSummary? nextPost;

  /// Optional previous post in the blog series.
  final BlogSummary? previousPost;

  @override
  List<Object?> get props => [nextPost, previousPost];
}
