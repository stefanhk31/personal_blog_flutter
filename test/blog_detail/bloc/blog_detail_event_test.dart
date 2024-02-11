// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:personal_blog_flutter/blog_detail/bloc/blog_detail_bloc.dart';

void main() {
  group('BlogDetailEvent', () {
    group('BlogDetailRequested', () {
      test('supports value comparisons', () {
        expect(
          BlogDetailRequested(),
          equals(
            BlogDetailRequested(),
          ),
        );
      });
    });

    group('BlogLinkClicked', () {
      test('supports value comparisons', () {
        expect(
          BlogLinkClicked(url: 'url'),
          equals(BlogLinkClicked(url: 'url')),
        );
      });
    });
  });
}
