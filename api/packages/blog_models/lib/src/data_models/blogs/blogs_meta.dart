import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blogs_meta.g.dart';

/// {@template blogs_meta}
/// Data class representing metadata for a list of blog posts.
/// {@endtemplate}
@JsonSerializable()
class BlogsMeta extends Equatable {
  /// {@macro blogs_meta}
  const BlogsMeta({
    required this.count,
    this.nextPage,
    this.previousPage,
  });

  /// Deserialize a Meta object from a Map
  factory BlogsMeta.fromJson(Map<String, dynamic> json) =>
      _$BlogsMetaFromJson(json);

  /// Serialize a Meta object to a Map
  Map<String, dynamic> toJson() => _$BlogsMetaToJson(this);

  /// Total number of blog posts
  final int count;

  /// Optional page number for the next page of blog posts
  final int? nextPage;

  /// Optional page number for the previous page of blog posts
  final int? previousPage;

  @override
  List<Object?> get props => [count, nextPage, previousPage];
}
