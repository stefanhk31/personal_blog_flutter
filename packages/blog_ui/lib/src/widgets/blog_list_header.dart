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
    final size = MediaQuery.sizeOf(context);

    return SliverAppBar(
      expandedHeight: 200,
      backgroundColor: theme.colorScheme.surfaceTint,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          title,
          style: BlogTextStyles.listHeaderTextStyle.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
          textScaler: const TextScaler.linear(.75),
        ),
        background: background,
        titlePadding: BlogSpacing.allPadding,
        expandedTitleScale: size.width < 600 ? 1.0 : 1.5,
      ),
    );
  }
}
