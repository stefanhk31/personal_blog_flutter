import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:equatable/equatable.dart';

/// Category attributed to the blog post for classification purposes.
class BlogCategory extends Equatable {
  /// Default constructor for a blog category.
  const BlogCategory({
    required this.name,
    required this.slug,
  });

  /// Creates a [BlogCategory] from the Butter CMS [Category] model.
  factory BlogCategory.fromButter(Category category) => BlogCategory(
        name: category.name,
        slug: category.slug,
      );

  /// Human-readable name of the category.
  final String name;

  /// Unique slug to search for the category.
  final String slug;

  @override
  List<Object> get props => [name, slug];
}
