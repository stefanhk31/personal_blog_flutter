import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/dom.dart' as dom;

/// Extension on ThemeData for rendering styles in Html widgets.
extension ThemeExt on ThemeData {
  /// Builder to convert theme data into CSS styles for HTML content.
  /// NOTE: as of v0.15.0 of flutter_widget_from_html, iframe elements
  /// cannot be rendered:
  /// https://github.com/daohoangson/flutter_widget_from_html/issues/1245
  Map<String, String>? styleBuilder(dom.Element element) {
    final el = element.localName
        ?.replaceAll(RegExp('<html'), '')
        .replaceAll(RegExp('>'), '');

    if (el == 'a') {
      return {
        'color': colorScheme.secondary.toHex(),
        ...BlogTextStyles.detailBodyTextStyle.toStyleMap(),
      };
    } else if (el == 'code') {
      return {
        'color': colorScheme.primary.toHex(),
        ...GoogleFonts.robotoMono().toStyleMap(),
      };
    } else if (el == 'div') {
      return {
        'color': colorScheme.primary.toHex(),
      };
    } else if (el == 'figcaption') {
      return {
        'color': colorScheme.primary.toHex(),
        ...BlogTextStyles.footerTextStyle.toStyleMap(),
      };
    } else if (el == 'h1') {
      return {
        'color': colorScheme.primary.toHex(),
        ...BlogTextStyles.headerTextStyle.toStyleMap(),
      };
    } else if (el == 'h2') {
      return {
        'color': colorScheme.primary.toHex(),
        ...BlogTextStyles.headerSubtitleTextStyle.toStyleMap(),
      };
    } else if (el == 'h3') {
      return {
        'color': colorScheme.primary.toHex(),
        ...BlogTextStyles.cardTitle.toStyleMap(),
      };
    } else if (el == 'li') {
      return {
        'color': colorScheme.primary.toHex(),
      };
    } else if (el == 'p') {
      return {
        'color': colorScheme.primary.toHex(),
        ...BlogTextStyles.detailBodyTextStyle.toStyleMap(),
      };
    } else if (el == 'pre') {
      return {
        'background-color': colorScheme.primaryContainer.toHex(),
        'padding': '16px',
      };
    }

    return null;
  }
}
