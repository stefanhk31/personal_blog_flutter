import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';

/// {@template blog_overview_header}
/// Header to display at the top of a blog list.
/// Returns of [SliverAppBar].
/// {@endtemplate}
class BlogListHeader extends StatelessWidget {
  /// {@macro blog_overview_header}
  const BlogListHeader({
    required this.title,
    required this.background,
    super.key,
  });

  /// The title to display in the header.
  final String title;

  /// The background image to display in the header.
  final Image background;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      expandedHeight: 200,
      backgroundColor: theme.colorScheme.surfaceTint,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          title,
          style: BlogTextStyles.headerTextStyle.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
        background: background,
      ),
    );
  }
}
