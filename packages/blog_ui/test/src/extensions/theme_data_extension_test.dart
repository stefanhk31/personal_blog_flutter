import 'package:blog_ui/blog_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/dom.dart' as dom;

void main() {
  group('ThemeDataExtension', () {
    group('styleBuilder', () {
      final htmlElementVariants = ValueVariant({
        'a',
        'code',
        'div',
        'figcaption',
        'h1',
        'h2',
        'h3',
        'li',
        'p',
        'pre',
      });

      testWidgets(
        'returns correct style for HTML element',
        (tester) async {
          final theme = BlogTheme.lightThemeData;
          final el = htmlElementVariants.currentValue ?? 'a';
          final element = dom.Element.html(
            '<$el>',
          );

          Map<String, String>? expectedStyle(String el) {
            if (el == 'a') {
              return {
                'color': theme.colorScheme.secondary.toHex(),
                ...BlogTextStyles.detailBodyTextStyle.toStyleMap(),
              };
            } else if (el == 'code') {
              return {
                'color': theme.colorScheme.primary.toHex(),
                ...GoogleFonts.robotoMono().toStyleMap(),
              };
            } else if (el == 'div') {
              return {
                'color': theme.colorScheme.primary.toHex(),
              };
            } else if (el == 'figcaption') {
              return {
                'color': theme.colorScheme.primary.toHex(),
                ...BlogTextStyles.footerTextStyle.toStyleMap(),
              };
            } else if (el == 'h1') {
              return {
                'color': theme.colorScheme.primary.toHex(),
                ...BlogTextStyles.headerTextStyle.toStyleMap(),
              };
            } else if (el == 'h2') {
              return {
                'color': theme.colorScheme.primary.toHex(),
                ...BlogTextStyles.listHeaderTextStyle.toStyleMap(),
              };
            } else if (el == 'h3') {
              return {
                'color': theme.colorScheme.primary.toHex(),
                ...BlogTextStyles.cardTitle.toStyleMap(),
              };
            } else if (el == 'li') {
              return {
                'color': theme.colorScheme.primary.toHex(),
              };
            } else if (el == 'p') {
              return {
                'color': theme.colorScheme.primary.toHex(),
                ...BlogTextStyles.detailBodyTextStyle.toStyleMap(),
              };
            } else if (el == 'pre') {
              return {
                'background-color': theme.colorScheme.primaryContainer.toHex(),
                'padding': '16px',
              };
            }

            return null;
          }

          expect(
            theme.styleBuilder(element),
            equals(
              expectedStyle(el),
            ),
          );
        },
        variant: htmlElementVariants,
      );

      test('returns null for unknown HTML element', () {
        final theme = BlogTheme.lightThemeData;
        final element = dom.Element.html('<unknown>');

        expect(
          theme.styleBuilder(element),
          isNull,
        );
      });
    });
  });
}
