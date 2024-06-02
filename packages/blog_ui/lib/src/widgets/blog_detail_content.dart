import 'dart:async';

import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';

/// {@template blog_detail_content}
/// A widget that displays detailed content of a blog post.
/// {@endtemplate}
class BlogDetailContent extends StatelessWidget {
  /// {@macro blog_detail_content}
  const BlogDetailContent({
    required this.authorName,
    required this.body,
    required this.published,
    required this.slug,
    required this.title,
    this.authorImage,
    this.featuredImage,
    this.onTapUrl,
    super.key,
  });

  /// The full name of the author of the blog post.
  final String authorName;

  /// The body content of the blog post, in stringified HTML format.
  final String body;

  /// The date and time the blog post was published.
  final DateTime published;

  /// The unique identifier of the blog post.
  final String slug;

  /// The title of the blog post.
  final String title;

  /// The URL of the author's profile image.
  final String? authorImage;

  /// The URL of the featured image of the blog post.
  final String? featuredImage;

  /// A callback function that is called when a link in the HTML body is tapped.
  final FutureOr<bool> Function(String)? onTapUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: BlogSpacing.horizontalPaddingLarge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (featuredImage != null) ...[
              Row(
                children: [
                  Expanded(
                    child: FeaturedImage(
                      imageUrl: featuredImage!,
                      imageTag: slug,
                      constraints: const BoxConstraints(
                        maxHeight: 500,
                      ),
                    ),
                  ),
                ],
              ),
              BlogSpacing.mediumVerticalSpacing,
            ],
            AuthorTile(
              author: authorName,
              authorImage: authorImage,
            ),
            Text(
              DateFormat('MMMM d, yyyy').format(published),
              style: BlogTextStyles.subtitleTextStyle.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              title,
              style: BlogTextStyles.headerTextStyle.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: HtmlWidget(
                    body,
                    customStylesBuilder: theme.styleBuilder,
                    onTapUrl: onTapUrl,
                    rebuildTriggers: [theme],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
