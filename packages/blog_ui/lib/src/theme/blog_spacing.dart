import 'package:flutter/material.dart';

/// Class to hold spacing values for the blog UI.
abstract class BlogSpacing {
  /// Margin to be used at the bottom of a widget.
  static const EdgeInsets bottomMargin = EdgeInsets.only(bottom: 20);

  /// Margin to be used at the top of a widget.
  static const EdgeInsets topMargin = EdgeInsets.only(top: 20);

  /// No padding to be used in a widget.
  static const EdgeInsets noPadding = EdgeInsets.zero;

  /// Padding to be used horizontally in a widget.
  static const EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 15);

  /// Large padding to be used horizontally in a widget.
  static const EdgeInsets horizontalPaddingLarge =
      EdgeInsets.symmetric(horizontal: 30);

  /// Padding to be used on all sides in a widget.
  static const EdgeInsets allPadding = EdgeInsets.all(15);

  /// Large vertical spacing to place between widgets.
  static const SizedBox largeVerticalSpacing = SizedBox(height: 15);

  /// Medium vertical spacing to place between widgets.
  static const SizedBox mediumVerticalSpacing = SizedBox(height: 10);

  /// Small vertical spacing to place between widgets.
  static const SizedBox smallVerticalSpacing = SizedBox(height: 5);
}
