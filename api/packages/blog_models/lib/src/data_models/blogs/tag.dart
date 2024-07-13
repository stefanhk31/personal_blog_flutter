import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

/// {@template tag}
/// Data model representing a tag for a blog post.
/// {@endtemplate}
@JsonSerializable()
class Tag extends Equatable {
  /// {@macro tag}
  const Tag({
    required this.name,
    required this.slug,
  });

  /// Creates a tag object from a JSON map.
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  /// Converts the tag object to a JSON map.
  Map<String, dynamic> toJson() => _$TagToJson(this);

  /// The name of the tag.
  final String name;

  /// The slug of the tag.
  final String slug;

  @override
  List<Object?> get props => [name, slug];
}
