import 'package:flutter/material.dart';

/// Widget to display an author's avatar.
class AuthorAvatar extends StatelessWidget {
  /// Default constructor for an author's avatar.
  const AuthorAvatar({required this.imageUrl, super.key});

  /// Url of the author's image.
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundImage: NetworkImage(imageUrl),
    );
  }
}
