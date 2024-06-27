import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:personal_blog_flutter/l10n/l10n.dart';

class BlogOverviewHeader extends StatelessWidget {
  const BlogOverviewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO (@stefanhk31): update title, add background image
    return FlexibleSpaceBar(
      title: Text(
        context.l10n.blogOverviewHeaderSubtitle,
        style: BlogTextStyles.headerSubtitleTextStyle.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
