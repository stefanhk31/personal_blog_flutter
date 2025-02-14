import 'dart:async';
import 'dart:io';

import 'package:blog_html_builder/blog_html_builder.dart';

/// {@template HtmlTemplate}
/// An abstract class for generating HTML content to be delivered to the client.
/// {@endtemplate}
// ignore: one_member_abstracts
abstract class HtmlTemplate {
  /// {@macro HtmlTemplate}
  const HtmlTemplate({
    required this.templateEngine,
  });

  /// Parser to read HTML content.
  final TemplateEngine templateEngine;

  /// Generates the HTML content to be delivered to the client.
  Future<String> html();

  /// Provide the base path to the HTML template file.
  String get basePath => '${Directory.current.path}/lib/src/templates/';
}
