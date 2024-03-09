import 'package:flutter/material.dart';

/// {@template featured_image}
/// Widget that displays full-width feature image
/// for a blog post.
/// {@endtemplate}
class FeaturedImage extends StatelessWidget {
  /// {@macro featured_image}
  const FeaturedImage({
    required this.imageUrl,
    this.imageTag,
    this.constraints,
    super.key,
  });

  /// Url of the image to display.
  final String imageUrl;

  /// Optional tag of the image.
  final String? imageTag;

  /// Optional constraints to apply to the image.
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    final image = Image.network(
      imageUrl,
      fit: BoxFit.fitWidth,
      semanticLabel: imageTag,
    );

    return constraints != null
        ? ConstrainedBox(
            constraints: constraints!,
            child: image,
          )
        : image;
  }
}
