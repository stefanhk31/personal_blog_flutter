import 'package:blog_models/src/data_models/data_models.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog.g.dart';

/// {@template blog}
/// Data model for a blog post.
/// {@endtemplate}
@JsonSerializable()
class Blog extends Equatable {
  /// {@macro blog}
  const Blog({
    required this.created,
    required this.updated,
    required this.published,
    required this.author,
    required this.categories,
    required this.tags,
    required this.featuredImageAlt,
    required this.slug,
    required this.title,
    required this.summary,
    required this.seoTitle,
    required this.metaDescription,
    required this.status,
    this.url,
    this.body,
    this.featuredImage,
  });

  /// Deserialize a Blog object from a Map
  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);

  /// Serialize a Blog object to a Map
  Map<String, dynamic> toJson() => _$BlogToJson(this);
  //need to specify category/tags correctly

  static List<Map<String, dynamic>> _categoriesToJson(
    List<Category> categories,
  ) =>
      categories.map((category) => category.toJson()).toList();

  static List<Map<String, dynamic>> _tagsToJson(List<Tag> tags) =>
      tags.map((tag) => tag.toJson()).toList();

  /// Optional URL of the blog post
  final String? url;

  /// Date and time the blog post was created
  final DateTime created;

  /// Date and time the blog post was last updated
  final DateTime updated;

  /// Date and time the blog post was published
  final DateTime published;

  /// Author of the blog post
  final Author author;

  /// Categories associated with the blog post
  @JsonKey(toJson: _categoriesToJson)
  final List<Category> categories;

  /// Tags associated with the blog post
  @JsonKey(toJson: _tagsToJson)
  final List<Tag> tags;

  /// URL of the featured image
  final String? featuredImage;

  /// Alternative text for the featured image
  final String featuredImageAlt;

  /// URL slug for the blog post
  final String slug;

  /// Title of the blog post
  final String title;

  /// Body content of the blog post. Can be excluded
  /// by setting excludeBody to `true` in the API request.
  final String? body;

  /// Summary of the blog post
  final String summary;

  /// SEO title of the blog post
  final String seoTitle;

  /// Meta description of the blog post
  final String metaDescription;

  /// Status of the blog post
  final String status;

  @override
  List<Object?> get props {
    return [
      url,
      created,
      updated,
      published,
      author,
      categories,
      tags,
      featuredImage,
      featuredImageAlt,
      slug,
      title,
      body,
      summary,
      seoTitle,
      metaDescription,
      status,
    ];
  }
}
