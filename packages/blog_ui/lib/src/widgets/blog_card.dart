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
        margin: const EdgeInsets.only(bottom: 20),
        surfaceTintColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (imageUrl != null)
              Hero(
                tag: imageTag ?? 'hero-image-tag',
                child: Image.network(imageUrl!, fit: BoxFit.cover),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Text(title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(subtitle,
                      style: const TextStyle(
                          fontSize: 16, color: Colors.blueGrey)),
                  const SizedBox(height: 10),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: authorImage != null
                        ? CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(authorImage!),
                          )
                        : null,
                    title: Text(
                      author,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
