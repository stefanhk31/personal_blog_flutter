import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

/// {@template category}
/// Data model representing a blog category.
/// {@endtemplate}
@JsonSerializable()
class Category extends Equatable {
  /// {@macro category}
  const Category({
    required this.name,
    required this.slug,
  });

  /// Creates a [Category] object from its JSON representation.
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  /// Converts the [Category] object to a JSON representation.
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  /// The name of the category.
  final String name;

  /// The slug of the category.
  final String slug;

  @override
  List<Object?> get props => [name, slug];
}
