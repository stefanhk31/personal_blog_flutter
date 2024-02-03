import 'package:blog_repository/src/models/models.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:equatable/equatable.dart';

/// Represents all content received for a blog post.
/// Consists of a [preview] and [detail].
class BlogPost extends Equatable {
  /// Default constructor for a blog post.
  const BlogPost({
    required this.preview,
    required this.detail,
  });

  /// Creates a [BlogPost] from the Butter CMS [Blog] model.
  factory BlogPost.fromButter(Blog blog) => BlogPost(
        preview: BlogPreview.fromButter(blog),
        detail: BlogDetail.fromButter(blog),
      );

  /// Preview of the blog post.
  final BlogPreview preview;

  /// Detailed content of the blog post.
  final BlogDetail detail;

  @override
  List<Object?> get props => [preview, detail];
}
