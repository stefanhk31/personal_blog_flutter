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

  /// Style for the error text.
  static const TextStyle errorTextStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w800,
  );

  /// Style for the footer text.
  static const TextStyle footerTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  /// Style for the header text.
  static const TextStyle headerTextStyle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w800,
  );

  /// Style for the header subtitle text.
  static const TextStyle headerSubtitleTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  );

  /// Style for general subtitles.
  static const TextStyle subtitleTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}
