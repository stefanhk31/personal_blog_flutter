import 'package:blog_ui/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BlogTheme', () {
    test('uses material 3', () {
      expect(BlogTheme.themeData.useMaterial3, isTrue);
    });

    test('background color is seedWhite', () {
      expect(
        BlogTheme.themeData.colorScheme.background,
        equals(BlogColors.seedWhite),
      );
    });

    test('visual density is adaptive platform density', () {
      expect(
        BlogTheme.themeData.visualDensity,
        equals(VisualDensity.adaptivePlatformDensity),
      );
    });
  });
}
