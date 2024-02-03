import 'package:blog_ui/src/theme/theme.dart';
import 'package:blog_ui/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// Widget to display a card with a preview of a blog post.
class BlogCard extends StatelessWidget {
  /// Default constructor for a blog card.
  const BlogCard({
    required this.title,
    required this.subtitle,
    required this.author,
    required this.onTap,
    this.imageUrl,
    this.imageTag,
    this.authorImage,
    super.key,
  });

  /// Title of the card.
  final String title;

  /// Short subtitle of the card.
  final String subtitle;

  /// Name of the card's author.
  final String author;

  /// Callback to call when card is tapped.
  final VoidCallback onTap;

  /// Optional url of a preview image.
  final String? imageUrl;

  /// Unique tag of the card image.
  final String? imageTag;

  /// Optional url of the author's image.
  final String? authorImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        clipBehavior: Clip.hardEdge,
        margin: BlogSpacing.bottomMargin,
        surfaceTintColor: BlogColors.seedWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (imageUrl != null)
              BlogCardHero(
                tag: imageTag ?? 'hero-image-tag',
                imageUrl: imageUrl!,
              ),
            Padding(
              padding: BlogSpacing.horizontalPadding,
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
                  AuthorTile(
                    author: author,
                    authorImage: authorImage,
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
