import 'dart:io';

import 'package:blog_html_builder/blog_html_builder.dart';
import 'package:logging/logging.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockLogger extends Mock implements Logger {}

void main() {
  group('TemplateEngine', () {
    late Logger logger;
    final basePath = '${Directory.current.path}/test/src/fixtures';
    const title = 'Test Title';
    const imageUrl = 'https://example.com/image.png';
    const header = 'Test Header';
    const people = [
      {'name': 'John Doe'},
      {'name': 'Jane Doe'},
    ];
    const inner = '<p>Inner</p>';
    final innerHtml = TemplateEngine(context: {'inner': inner});

    setUp(
      () {
        logger = _MockLogger();
        when(
          () => logger.warning(any()),
        ).thenAnswer((_) {});
        when(
          () => logger.severe(any()),
        ).thenAnswer((_) {});
      },
    );

    group('render', () {
      // Refactor into smaller tests by fields, iterables, conditionals?
      test('can insert fields into template', () async {
        final context = {
          'title': title,
          'imageUrl': imageUrl,
          'header': header,
          'people': people,
        };
        final engine = TemplateEngine(context: context, logger: logger);
        final result = await engine.render('$basePath/template.html');
        expect(result, contains('<title>$title</title>'));
        expect(
          result,
          contains('<meta property="og:image" content="$imageUrl">'),
        );
        expect(result, contains('<h1>$header</h1>'));
        for (final person in people) {
          expect(result, contains('<p>${person['name']}</p>'));
        }
      });

      test('omits fields when not present', () {
        //test null imageUrl and header
      });

      test('can insert fields based on negation', () {
        //test no names
      });
    });
  });
}
