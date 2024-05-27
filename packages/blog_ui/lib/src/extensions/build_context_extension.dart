import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/dom.dart' as dom;

/// Extension on BuildContext for rendering styles in Html widgets.
extension BuildContextExt on BuildContext {
  /// Builder to convert theme data into CSS styles for HTML content.
  /// NOTE: as of v0.15.0 of flutter_widget_from_html, <iframe> elements
  /// cannot be rendered:
  /// https://github.com/daohoangson/flutter_widget_from_html/issues/1245
  Map<String, String>? styleBuilder(dom.Element element) {
    final el = element.localName
        ?.replaceAll(RegExp('<html'), '')
        .replaceAll(RegExp('>'), '');
    final theme = Theme.of(this);

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
        ...BlogTextStyles.headerSubtitleTextStyle.toStyleMap(),
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
}
