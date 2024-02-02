import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:equatable/equatable.dart';

/// Tag attributed to the blog post for search and filter purposes.
class BlogTag extends Equatable {
  /// Default constructor for a blog tag.
  const BlogTag({
    required this.name,
    required this.slug,
  });

  /// Creates a [BlogTag] from the Butter CMS [Tag] model.
  factory BlogTag.fromButter(Tag tag) => BlogTag(
        name: tag.name,
        slug: tag.slug,
      );

  /// Human-readable name of the tag.
  final String name;

  /// Unique slug to search for the tag.
  final String slug;

  @override
  List<Object?> get props => [name, slug];
}
