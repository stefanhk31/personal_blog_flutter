import 'package:equatable/equatable.dart';

/// Represents detailed contend of a blog post.
class BlogDetail extends Equatable {
  /// Default constructor for a blog detail.
  const BlogDetail({
    required this.title,
    required this.published,
    required this.body,
  });

  //// Title of the blog post
  final String title;

  /// Date of publication of the blog post.
  final DateTime published;

  /// Content of the blog post.
  final String body;

  @override
  List<Object> get props => [title, published, body];
}
