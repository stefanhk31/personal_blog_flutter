// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:personal_blog_flutter/app/widgets/footer/cubit/footer_cubit.dart';

void main() {
  group('FooterState', () {
    group('FooterInitial', () {
      test('supports value comparisons', () {
        expect(FooterInitial(), equals(FooterInitial()));
      });
    });

    group('FooterFailure', () {
      test('supports value comparisons', () {
        expect(
          FooterFailure(error: 'error'),
          equals(
            FooterFailure(error: 'error'),
          ),
        );
      });
    });
  });
}
