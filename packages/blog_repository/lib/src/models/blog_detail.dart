import 'package:blog_models/blog_models.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:equatable/equatable.dart';

/// Represents detailed content of a blog post.
class BlogDetail extends Equatable {
  /// Default constructor for a blog detail.
  const BlogDetail({
    required this.title,
    required this.published,
    required this.body,
    required this.slug,
    required this.author,
    required this.tags,
    required this.categories,
    this.featuredImage,
    this.featuredImageAlt,
    this.url,
  });

  /// Creates a [BlogDetail] from the API[Blog] model.

  factory BlogDetail.fromApi(Blog blog) => BlogDetail(
        title: blog.title,
        published: blog.published,
        body: blog.body ?? '',
        slug: blog.slug,
        url: blog.url,
        author: BlogAuthor.fromApi(blog.author),
        tags: blog.tags,
        categories: blog.categories,
        featuredImage: blog.featuredImage,
        featuredImageAlt: blog.featuredImageAlt,
      );

  //// Title of the blog post
  final String title;

  /// Date of publication of the blog post.
  final DateTime published;

  /// Content of the blog post.
  final String body;

  /// Unique slug of the blog post.
  final String slug;

  /// Author of the blog post.
  final BlogAuthor author;

  /// Tags associated with the blog post.
  final List<Tag> tags;

  /// Categories associated with the blog post.
  final List<Category> categories;

  /// Optional url to the featured image of the blog post.
  final String? featuredImage;

  /// Optional alternate text for a featured image.
  final String? featuredImageAlt;

  /// Optional url to access the blog post in Butter CMS.
  final String? url;

  @override
  List<Object?> get props => [
        title,
        published,
        body,
        slug,
        author,
        tags,
        categories,
        featuredImage,
        featuredImageAlt,
        url,
      ];
}
