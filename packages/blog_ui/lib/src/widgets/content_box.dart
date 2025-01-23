import 'package:flutter/material.dart';

/// {@template content_box}
/// A wrapper to place page content inside.
/// Contains default padding and max width constraints
/// that can be overridden.
/// {@endtemplate}
class ContentBox extends StatelessWidget {
  /// {@macro content_box}
  const ContentBox({
    required this.child,
    this.maxWidth = 1200,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  /// The content to be placed inside the box.
  final Widget child;

  /// The maximum width constraint of the box.
  final double maxWidth;

  /// The padding around the content.
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: child,
        ),
      ),
    );
  }
}
