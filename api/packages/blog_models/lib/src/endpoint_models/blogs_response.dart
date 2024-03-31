import 'package:blog_models/src/data_models/data_models.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blogs_response.g.dart';

/// {@template blogs_response}
/// Data model for the API response containing a list of blog posts.
/// {@endtemplate}
@JsonSerializable()
class BlogsResponse extends Equatable {
  /// {@macro blogs_response}
  const BlogsResponse({
    required this.meta,
    required this.data,
  });

  /// Deserialize a Blogs list from a Map
  factory BlogsResponse.fromJson(Map<String, dynamic> json) =>
      _$BlogsResponseFromJson(json);

  /// Serialize a Blogs list to a Map
  Map<String, dynamic> toJson() => _$BlogsResponseToJson(this);

  /// Metadata for the list of blog posts
  final BlogsMeta meta;

  /// List of blog posts
  final List<Blog> data;

  @override
  List<Object?> get props => [meta, data];
}
