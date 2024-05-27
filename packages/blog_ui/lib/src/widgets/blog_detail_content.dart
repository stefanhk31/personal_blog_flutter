import 'dart:async';

import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/dom.dart' as dom;
import 'package:intl/intl.dart';

/// {@template blog_detail_content}
/// A widget that displays detailed content of a blog post.
/// {@endtemplate}
class BlogDetailContent extends StatelessWidget {
  /// {@macro blog_detail_content}
  const BlogDetailContent({
    required this.authorName,
    required this.body,
    required this.published,
    required this.slug,
    required this.title,
    this.authorImage,
    this.featuredImage,
    this.onLinkTap,
    this.onTapUrl,
    super.key,
  });

  /// The full name of the author of the blog post.
  final String authorName;

  /// The body content of the blog post, in stringified HTML format.
  final String body;

  /// The date and time the blog post was published.
  final DateTime published;

  /// The unique identifier of the blog post.
  final String slug;

  /// The title of the blog post.
  final String title;

  /// The URL of the author's profile image.
  final String? authorImage;

  /// The URL of the featured image of the blog post.
  final String? featuredImage;

  /// A callback function that is called when a link in the HTML body is tapped.
  final void Function(String?, Map<String, String>, dom.Element?)? onLinkTap;

  /// A callback function that is called when a link in the HTML body is tapped.
  final FutureOr<bool> Function(String)? onTapUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: BlogSpacing.horizontalPaddingLarge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (featuredImage != null) ...[
              Row(
                children: [
                  Expanded(
                    child: FeaturedImage(
                      imageUrl: featuredImage!,
                      imageTag: slug,
                      constraints: const BoxConstraints(
                        maxHeight: 500,
                      ),
                    ),
                  ),
                ],
              ),
              BlogSpacing.mediumVerticalSpacing,
            ],
            AuthorTile(
              author: authorName,
              authorImage: authorImage,
            ),
            Text(
              DateFormat('MMMM d, yyyy').format(published),
              style: BlogTextStyles.subtitleTextStyle.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              title,
              style: BlogTextStyles.headerTextStyle.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: HtmlWidget(
                    body,
                    customStylesBuilder: context.styleBuilder,
                    onTapUrl: onTapUrl,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

extension BuildContextExt on BuildContext {
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

extension ColorExt on Color {
  String toHex() {
    return '#${value.toRadixString(16).substring(2)}';
  }
}

extension TextStyleExt on TextStyle {
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

/// A function that returns a [Map] of styles to be defined for
/// the HTML body.
Map<String, Style> styles(ThemeData theme) {
  Style style({
    Color? backgroundColor,
    Color? color,
    TextStyle? textStyle,
    HtmlPaddings? padding,
  }) {
    return Style(
      backgroundColor: backgroundColor,
      color: color,
      fontSize:
          textStyle?.fontSize != null ? FontSize(textStyle!.fontSize!) : null,
      fontStyle: textStyle?.fontStyle,
      fontWeight: textStyle?.fontWeight,
      fontFamily: textStyle?.fontFamily,
      padding: padding,
    );
  }

  return {
    'a': style(
      color: theme.colorScheme.secondary,
      textStyle: BlogTextStyles.detailBodyTextStyle,
    ),
    'code': style(
      backgroundColor: Colors.transparent,
      color: theme.colorScheme.primary,
      textStyle: GoogleFonts.robotoMono(),
    ),
    'div': style(color: theme.colorScheme.primary),
    'figcaption': style(
      color: theme.colorScheme.primary,
      textStyle: BlogTextStyles.footerTextStyle,
    ),
    'h1': style(
      color: theme.colorScheme.primary,
      textStyle: BlogTextStyles.headerTextStyle,
    ),
    'h2': style(
      color: theme.colorScheme.primary,
      textStyle: BlogTextStyles.headerSubtitleTextStyle,
    ),
    'h3': style(
      color: theme.colorScheme.primary,
      textStyle: BlogTextStyles.cardTitle,
    ),
    'li': style(color: theme.colorScheme.primary),
    'p': style(
      color: theme.colorScheme.primary,
      textStyle: BlogTextStyles.detailBodyTextStyle,
    ),
    'pre': style(
      backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
      padding: HtmlPaddings.all(16),
    ),
  };
}
