import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:personal_blog_flutter/l10n/l10n.dart';

class BlogOverviewHeader extends StatelessWidget {
  const BlogOverviewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: BlogSpacing.horizontalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.blogOverviewHeader.toUpperCase(),
              style: BlogTextStyles.headerTextStyle.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            BlogSpacing.smallVerticalSpacing,
            Text(
              context.l10n.blogOverviewHeaderSubtitle,
              style: BlogTextStyles.headerSubtitleTextStyle.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
