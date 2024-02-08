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
          BlogTheme.lightThemeData.colorScheme.background,
          equals(BlogColors.seedLightBackground),
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
          BlogTheme.darkThemeData.colorScheme.background,
          equals(BlogColors.seedDarkBackground),
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
