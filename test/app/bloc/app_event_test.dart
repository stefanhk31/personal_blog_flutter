// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:personal_blog_flutter/app/bloc/app_bloc.dart';

void main() {
  group('AppEvent', () {
    group('FooterLinkClicked', () {
      test('supports value comparisons', () {
        expect(
          FooterLinkClicked(url: 'url'),
          equals(FooterLinkClicked(url: 'url')),
        );
      });
    });
  });
}
