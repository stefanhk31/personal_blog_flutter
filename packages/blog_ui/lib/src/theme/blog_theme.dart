import 'package:blog_ui/src/theme/theme.dart';
import 'package:flutter/material.dart';

/// Base theme of the blog UI.
class BlogTheme {
  /// Theme data to access light theme properties in build context.
  static ThemeData get lightThemeData => ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: BlogColors.seedLightBackground,
      );

  /// Theme data to access dark theme properties in build context.
  static ThemeData get darkThemeData => ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: BlogColors.seedDarkBackground,
      );

  /// Color scheme that is used to generate light theme colors.
  static ColorScheme get lightColorScheme => ColorScheme.fromSeed(
        seedColor: BlogColors.seedPurple,
        primary: BlogColors.seedTextPrimaryDark,
        primaryContainer: BlogColors.seedLightPrimaryContainer,
        secondary: BlogColors.seedTextSecondaryDark,
      );

  /// Color scheme that is used to generate dark theme colors.
  static ColorScheme get darkColorScheme => ColorScheme.fromSeed(
        seedColor: BlogColors.seedLightPurple,
        primary: BlogColors.seedTextPrimaryLight,
        secondary: BlogColors.seedTextSecondaryLight,
        primaryContainer: BlogColors.seedDarkPrimaryContainer,
      );
}
