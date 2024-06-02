import 'package:flutter/material.dart';

/// Extension on Color for rendering content in Html widgets.
extension ColorExtension on Color {
  /// Parses the hex string from a [Color].
  String toHex() {
    return '#${value.toRadixString(16).substring(2)}';
  }
}
