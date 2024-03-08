// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:personal_blog_flutter/app/widgets/footer/bloc/bloc/footer_bloc.dart';

void main() {
  group('FooterEvent', () {
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
