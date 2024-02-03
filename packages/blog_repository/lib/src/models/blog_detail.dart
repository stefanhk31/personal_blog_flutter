import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:equatable/equatable.dart';

/// Represents detailed contend of a blog post.
class BlogDetail extends Equatable {
  /// Default constructor for a blog detail.
  const BlogDetail({
    required this.title,
    required this.published,
    required this.body,
  });

  /// Creates a [BlogDetail] from the Butter CMS [Blog] model.
  factory BlogDetail.fromButter(Blog blog) => BlogDetail(
        title: blog.title,
        published: blog.published,
        body: blog.body,
      );

  //// Title of the blog post
  final String title;

  /// Date of publication of the blog post.
  final DateTime published;

  /// Content of the blog post.
  final String body;

  @override
  List<Object> get props => [title, published, body];
}
