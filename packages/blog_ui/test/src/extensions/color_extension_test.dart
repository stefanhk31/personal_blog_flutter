import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ColorExtension', () {
    group('toHex', () {
      test('returns pound sign plus the correct hex value ', () {
        const color = Color(0xFF00FF00);
        expect(color.toHex(), '#00ff00');
      });
    });
  });
}
