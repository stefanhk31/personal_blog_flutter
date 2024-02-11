import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:personal_blog_flutter/l10n/l10n.dart';

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
            ? 'assets/images/butter_cms_black.png'
            : 'assets/images/butter_cms_white.png';
    return SizedBox(
      height: 75,
      child: Padding(
        padding: BlogSpacing.horizontalPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(imageSource),
              ),
            ),
            Expanded(
              child: Text(
                context.l10n.copyrightText(DateTime.now().year),
                style: BlogTextStyles.footerTextStyle.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
