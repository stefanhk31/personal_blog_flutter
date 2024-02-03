import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Widget representing a hero banner on top of a blog card.
class BlogCardHero extends StatelessWidget {
  /// Default constructor for a blog card hero.
  const BlogCardHero({
    required this.tag,
    required this.imageUrl,
    super.key,
  });

  /// Tag to be atributed to the hero banner.
  final String tag;

  /// Url of the image displayed on the banner.
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }
}
