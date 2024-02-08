import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';

/// Site-wide footer for the blog.
class Footer extends StatelessWidget {
  /// Default constructor for the footer.
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final imageSource =
        Theme.of(context).colorScheme == BlogTheme.lightColorScheme
            ? 'packages/blog_ui/assets/images/butter_cms_black.png'
            : 'packages/blog_ui/assets/images/butter_cms_white.png';
    return Row(
      children: [
        SizedBox(
          height: 75,
          child: Image.asset(imageSource),
        ),
      ],
    );
  }
}
