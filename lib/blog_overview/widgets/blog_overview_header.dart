import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:personal_blog_flutter/l10n/l10n.dart';

class BlogOverviewHeader extends StatelessWidget {
  const BlogOverviewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      expandedHeight: 200,
      backgroundColor: theme.colorScheme.surfaceTint,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          context.l10n.blogOverviewListTitle,
          style: BlogTextStyles.headerTextStyle.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
        background: Image.asset(
          'assets/images/background.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
