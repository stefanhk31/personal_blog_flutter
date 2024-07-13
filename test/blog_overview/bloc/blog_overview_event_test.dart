// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:personal_blog_flutter/blog_overview/bloc/blog_overview_bloc.dart';

void main() {
  group('BlogOverviewEvent', () {
    group('BlogOverviewPostsRequested', () {
      test('supports value comparisons', () {
        expect(
          BlogOverviewInitialPostsRequested(),
          equals(BlogOverviewInitialPostsRequested()),
        );
      });
    });
  });
}
