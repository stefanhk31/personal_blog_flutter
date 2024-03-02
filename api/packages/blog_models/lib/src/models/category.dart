import 'package:equatable/equatable.dart';

/// Data model representing a blog category.
class Category extends Equatable {
  /// Creates a new instance of the [Category] class.
  const Category({
    required this.name,
    required this.slug,
  });

  /// Creates a [Category] object from its JSON representation.
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'] as String,
      slug: json['slug'] as String,
    );
  }

  /// The name of the category.
  final String name;

  /// The slug of the category.
  final String slug;

  @override
  List<Object?> get props => [name, slug];

  /// Converts the [Category] object to a JSON representation.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'slug': slug,
    };
  }
}
