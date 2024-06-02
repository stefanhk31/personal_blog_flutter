import 'package:flutter/material.dart';

/// Extension on [TextStyle] to facilitate converting theme data
/// to HTML/CSS styling.
extension TextStyleExtension on TextStyle {
  /// Convert elements of a [TextStyle] to a [Map] of
  /// CSS properties.
  Map<String, String> toStyleMap() {
    final map = <String, String>{};

    if (fontSize != null) {
      map['font-size'] = '${fontSize}px';
    }

    if (fontStyle != null) {
      map['font-style'] = fontStyle!.name.toLowerCase();
    }

    if (fontWeight != null) {
      map['font-weight'] = fontWeight!.value.toString();
    }

    if (fontFamily != null) {
      map['font-family'] = fontFamily!;
    }

    return map;
  }
}
