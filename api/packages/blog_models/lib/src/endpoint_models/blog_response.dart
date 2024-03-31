import 'package:blog_models/src/data_models/data_models.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog_response.g.dart';

/// {@template blog_response}
/// Data model for the API response containing a single blog post.
/// {@endtemplate}
@JsonSerializable()
class BlogResponse extends Equatable {
  /// {@macro blog_response}
  const BlogResponse({
    required this.meta,
    required this.data,
  });

  /// Factory method to create a BlogResponse object from a JSON map.
  factory BlogResponse.fromJson(Map<String, dynamic> json) =>
      _$BlogResponseFromJson(json);

  /// Convert the BlogResponse object to a JSON map.
  Map<String, dynamic> toJson() => _$BlogResponseToJson(this);

  /// Metadata for the single blog post.
  final BlogMeta meta;

  /// Blog post contained in the Blog Response.
  final Blog data;

  @override
  List<Object?> get props => [meta, data];
}
