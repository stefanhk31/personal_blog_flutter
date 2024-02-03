import 'package:flutter/material.dart';

/// Class to hold text styles for the blog UI.
abstract class BlogTextStyles {
  /// Style for the title of a blog card.
  static const TextStyle cardTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  /// Style for the subtitle of a blog card.
  static const TextStyle cardSubtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  /// Style for a subtitle of a list tile
  static const TextStyle listTileSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
}
