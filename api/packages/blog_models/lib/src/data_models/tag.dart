import 'package:equatable/equatable.dart';

/// {@template tag}
/// Data model representing a tag for a blog post.
/// {@endtemplate}
class Tag extends Equatable {
  /// {@macro tag}
  const Tag({
    required this.name,
    required this.slug,
  });

  /// Creates a tag object from a JSON map.
  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      name: json['name'] as String,
      slug: json['slug'] as String,
    );
  }

  /// The name of the tag.
  final String name;

  /// The slug of the tag.
  final String slug;

  @override
  List<Object?> get props => [name, slug];

  /// Converts the tag object to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'slug': slug,
    };
  }
}
