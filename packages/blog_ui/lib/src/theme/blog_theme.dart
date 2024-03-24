import 'package:blog_ui/src/theme/theme.dart';
import 'package:flutter/material.dart';

/// Base theme of the blog UI.
class BlogTheme {
  /// Theme data to access light theme properties in build context.
  static ThemeData get lightThemeData => ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  /// Theme data to access dark theme properties in build context.
  static ThemeData get darkThemeData => ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  /// Color scheme that is used to generate light theme colors.
  static ColorScheme get lightColorScheme => ColorScheme.fromSeed(
        seedColor: BlogColors.seedPurple,
        background: BlogColors.seedLightBackground,
        primary: BlogColors.seedTextPrimaryDark,
        secondary: BlogColors.seedTextSecondaryDark,
      );

  /// Color scheme that is used to generate dark theme colors.
  static ColorScheme get darkColorScheme => ColorScheme.fromSeed(
        seedColor: BlogColors.seedLightPurple,
        background: BlogColors.seedDarkBackground,
        primary: BlogColors.seedTextPrimaryLight,
        secondary: BlogColors.seedTextSecondaryLight,
      );
}
