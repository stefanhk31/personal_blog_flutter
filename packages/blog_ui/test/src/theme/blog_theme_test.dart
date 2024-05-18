import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BlogTheme', () {
    group('LightThemeData', () {
      test('uses material 3', () {
        expect(BlogTheme.lightThemeData.useMaterial3, isTrue);
      });

      test('background color is seedLightBackground', () {
        expect(
          BlogTheme.lightThemeData.scaffoldBackgroundColor,
          equals(BlogColors.seedLightBackground),
        );
      });

      test('primary color is seedTextPrimaryDark', () {
        expect(
          BlogTheme.lightThemeData.colorScheme.primary,
          equals(BlogColors.seedTextPrimaryDark),
        );
      });

      test('secondary color is seedTextSecondaryDark', () {
        expect(
          BlogTheme.lightThemeData.colorScheme.secondary,
          equals(BlogColors.seedTextSecondaryDark),
        );
      });

      test('visual density is adaptive platform density', () {
        expect(
          BlogTheme.lightThemeData.visualDensity,
          equals(VisualDensity.adaptivePlatformDensity),
        );
      });
    });

    group('DarkThemeData', () {
      test('uses material 3', () {
        expect(BlogTheme.darkThemeData.useMaterial3, isTrue);
      });

      test('background color is seedDarkBackground', () {
        expect(
          BlogTheme.darkThemeData.scaffoldBackgroundColor,
          equals(BlogColors.seedDarkBackground),
        );
      });

      test('primary color is seedTextPrimaryLight', () {
        expect(
          BlogTheme.darkThemeData.colorScheme.primary,
          equals(BlogColors.seedTextPrimaryLight),
        );
      });

      test('secondary color is seedTextSecondaryLight', () {
        expect(
          BlogTheme.darkThemeData.colorScheme.secondary,
          equals(BlogColors.seedTextSecondaryLight),
        );
      });

      test('visual density is adaptive platform density', () {
        expect(
          BlogTheme.darkThemeData.visualDensity,
          equals(VisualDensity.adaptivePlatformDensity),
        );
      });
    });
  });
}
