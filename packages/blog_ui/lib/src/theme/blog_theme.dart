import 'package:blog_ui/src/theme/theme.dart';
import 'package:flutter/material.dart';

/// Base theme of the blog UI.
class BlogTheme {
  /// Theme data to access theme properties in build context.
  static ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  /// Color scheme that is used to generate theme colors.
  static ColorScheme get colorScheme => ColorScheme.fromSeed(
        seedColor: BlogColors.seedBlueGrey,
        background: BlogColors.seedWhite,
      );
}
