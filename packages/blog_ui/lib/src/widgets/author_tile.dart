import 'package:blog_ui/src/theme/theme.dart';
import 'package:blog_ui/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// List Tile displaying an author's details.
class AuthorTile extends StatelessWidget {
  /// Default constructor for an author tile.
  const AuthorTile({
    required this.author,
    this.authorImage,
    super.key,
  });

  /// Name of the author.
  final String author;

  /// Optional url of the author's image.
  final String? authorImage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: BlogSpacing.noPadding,
      leading:
          authorImage != null ? AuthorAvatar(imageUrl: authorImage!) : null,
      title: Text(
        author,
        style: BlogTextStyles.listTileSubtitle.copyWith(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
