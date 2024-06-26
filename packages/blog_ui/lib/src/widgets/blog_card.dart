import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Widget to display a card with a preview of a blog post.
class BlogCard extends StatelessWidget {
  /// Default constructor for a blog card.
  const BlogCard({
    required this.title,
    required this.subtitle,
    required this.published,
    required this.onTap,
    this.imageUrl,
    this.imageTag,
    super.key,
  });

  /// Title of the card.
  final String title;

  /// Short subtitle of the card.
  final String subtitle;

  /// Date of publication of the blog post.
  final DateTime published;

  /// Callback to call when card is tapped.
  final VoidCallback onTap;

  /// Optional url of a preview image.
  final String? imageUrl;

  /// Unique tag of the card image.
  final String? imageTag;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        clipBehavior: Clip.hardEdge,
        margin: BlogSpacing.bottomMargin,
        color: theme.colorScheme.secondaryContainer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (imageUrl != null)
              Row(
                children: [
                  Expanded(
                    child: FeaturedImage(
                      imageUrl: imageUrl!,
                      imageTag: imageTag,
                      constraints: const BoxConstraints(
                        maxHeight: 200,
                      ),
                    ),
                  ),
                ],
              ),
            Padding(
              padding: BlogSpacing.allPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlogSpacing.largeVerticalSpacing,
                  Text(
                    title,
                    style: BlogTextStyles.cardTitle,
                  ),
                  BlogSpacing.smallVerticalSpacing,
                  Text(
                    subtitle,
                    style: BlogTextStyles.cardSubtitle,
                  ),
                  BlogSpacing.mediumVerticalSpacing,
                  Text(
                    DateFormat('MMMM d, yyyy').format(published),
                    style: BlogTextStyles.cardSubtitle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
