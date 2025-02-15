import 'dart:async';
import 'dart:io';

import 'package:blog_html_builder/blog_html_builder.dart';

/// {@template HtmlTemplate}
/// An abstract class for generating HTML pages to be delivered to the client.
/// {@endtemplate}
// ignore: one_member_abstracts
abstract class HtmlPage {
  /// {@macro HtmlTemplate}
  const HtmlPage();

  /// Generate engine to read HTML files and insert dynamic data.
  TemplateEngine engine();

  /// Generates the HTML string to be delivered to the client.
  Future<String> html();

  /// Provide the base path to the HTML template file.
  String get basePath =>
      '${Directory.current.path}/packages/blog_html_builder/lib/src/templates/';
}
