import 'package:flutter/material.dart';

/// Extension on [TextStyle] to facilitate converting theme data
/// to HTML/CSS styling.
extension TextStyleExt on TextStyle {
  /// Convert elements of a [TextStyle] to a [Map] of
  /// CSS properties.
  Map<String, String> toStyleMap() {
    final map = <String, String>{};

    if (fontSize != null) {
      map['font-size'] = '${fontSize}px';
    }

    if (fontStyle != null) {
      map['font-style'] = fontStyle!.toString();
    }

    if (fontWeight != null) {
      map['font-weight'] = fontWeight!.toString();
    }

    if (fontFamily != null) {
      map['font-family'] = fontFamily!;
    }

    return map;
  }
}
