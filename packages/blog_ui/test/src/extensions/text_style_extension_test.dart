import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TextStyleExtension', () {
    group('toStyleMap', () {
      test('returns a map of CSS properties', () {
        const style = TextStyle(
          fontSize: 16,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        );

        expect(
          style.toStyleMap(),
          equals({
            'font-size': '16.0px',
            'font-style': 'italic',
            'font-weight': '700',
            'font-family': 'Roboto',
          }),
        );
      });
    });
  });
}
