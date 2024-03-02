import 'package:blog_models/src/models/models.dart';
import 'package:equatable/equatable.dart';

/// Data model for a blog post.
class Blog extends Equatable {
  /// Default constructor for a blog data model
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
  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      url: json['url'] as String?,
      created: DateTime.parse(json['created'] as String),
      updated: DateTime.parse(json['updated'] as String),
      published: DateTime.parse(json['published'] as String),
      author: Author.fromJson(json['author'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>)
          .map(
            (category) => Category.fromJson(category as Map<String, dynamic>),
          )
          .toList(),
      tags: (json['tags'] as List<dynamic>)
          .map((tag) => Tag.fromJson(tag as Map<String, dynamic>))
          .toList(),
      featuredImage: json['featured_image'] as String?,
      featuredImageAlt: json['featured_image_alt'] as String,
      slug: json['slug'] as String,
      title: json['title'] as String,
      body: json['body'] as String?,
      summary: json['summary'] as String,
      seoTitle: json['seo_title'] as String,
      metaDescription: json['meta_description'] as String,
      status: json['status'] as String,
    );
  }

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
  final List<Category> categories;

  /// Tags associated with the blog post
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

  /// Serialize a Blog object to a Map
  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'created': created.toIso8601String(),
      'updated': updated.toIso8601String(),
      'published': published.toIso8601String(),
      'author': author.toJson(),
      'categories': categories.map((category) => category.toJson()).toList(),
      'tags': tags.map((tag) => tag.toJson()).toList(),
      'featured_image': featuredImage,
      'featured_image_alt': featuredImageAlt,
      'slug': slug,
      'title': title,
      'body': body,
      'summary': summary,
      'seo_title': seoTitle,
      'meta_description': metaDescription,
      'status': status,
    };
  }
}
