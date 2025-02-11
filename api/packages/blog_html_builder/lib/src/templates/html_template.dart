import 'dart:async';
import 'dart:io';

/// {@template HtmlTemplate}
/// An abstract class for generating HTML content to be delivered to the client.
/// {@endtemplate}
// ignore: one_member_abstracts
abstract class HtmlTemplate {
  /// {@macro HtmlTemplate}
  const HtmlTemplate({
    this.templateEngine = const TemplateEngine(context: {}),
  });

  /// Parser to read HTML content.
  final TemplateEngine templateEngine;

  /// Generates the HTML content to be delivered to the client.
  FutureOr<String> html();
}

/// {@template TemplateEngine}
/// Engine to read the content of an HTML file and
/// replace placeholders with the provided properties.
/// {@endtemplate}
class TemplateEngine {
  /// {@macro TemplateEngine}
  const TemplateEngine({required this.context});

  /// Context storing the properties to be inserted into the HTML file.
  final Map<String, dynamic> context;

  /// Renders the content of an HTML file and parses according to
  /// the properties in [context].
  Future<String> render(String filePath) async {
    final file = await File(filePath).readAsString();

    final buffer = StringBuffer();

    final regex = RegExp(r'{{(.*?)}}|{{#(if|for)\s(.*?)}}|{{#/(if|for)}}');
    final matches = regex.allMatches(file);
    var lastIndex = 0;
    for (final match in matches) {
      buffer.write(file.substring(lastIndex, match.start));
      lastIndex = match.end;

      if (match.group(1) != null) {
        // Handle variable substitution
        final variable = match.group(1)!.trim();
        buffer.write(context[variable] ?? '');
      } else if (match.group(2) == 'if') {
        // Handle conditionals
        final condition = match.group(3)!.trim();
        if (_evaluateCondition(condition)) {
          // Extract and process the inner block
          final innerBlock = _extractBlock(file, match.end, '{{#/if}}');
          buffer.write(render(innerBlock));
        }
      } else if (match.group(2) == 'for') {
        // Handle loops
        final loopParts = match.group(3)!.split(' in ');
        final variable = loopParts[0].trim();
        final iterable = context[loopParts[1].trim()] as List<dynamic>?;
        if (iterable != null) {
          final innerBlock = _extractBlock(file, match.end, '{{#/for}}');
          for (final item in iterable) {
            context[variable] = item;
            buffer.write(render(innerBlock));
          }
          context.remove(variable);
        }
      }
    }
    buffer.write(file.substring(lastIndex));
    return buffer.toString();
  }

  bool _evaluateCondition(String condition) {
    final parts = condition.split('==').map((e) => e.trim()).toList();
    if (parts.length == 2) {
      return context[parts[0]]?.toString() == parts[1];
    }
    return false;
  }

  String _extractBlock(String template, int startIndex, String endTag) {
    final endIndex = template.indexOf(endTag, startIndex);
    if (endIndex == -1) throw Exception('Unmatched tag: $endTag');
    return template.substring(startIndex, endIndex);
  }
}
