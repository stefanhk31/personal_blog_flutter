import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

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
              title.toUpperCase(),
              style: BlogTextStyles.headerTextStyle.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            BlogSpacing.smallVerticalSpacing,
            Text(
              subtitle,
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
