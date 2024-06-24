// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:personal_blog_flutter/blog_overview/bloc/blog_overview_bloc.dart';

void main() {
  group('BlogOverviewState', () {
    group('BlogOverviewInitial', () {
      test('supports value comparisons', () {
        expect(BlogOverviewInitial(), equals(BlogOverviewInitial()));
      });
    });

    group('BlogOverviewLoading', () {
      test('supports value comparisons', () {
        expect(BlogOverviewLoading(), equals(BlogOverviewLoading()));
      });
    });

    group('BlogOverviewLoaded', () {
      test('supports value comparisons', () {
        expect(
          BlogOverviewLoaded(previews: const []),
          equals(BlogOverviewLoaded(previews: const [])),
        );
      });
    });

    group('BlogOverviewFailure', () {
      test('supports value comparisons', () {
        expect(
          BlogOverviewFailure(error: 'oops'),
          equals(BlogOverviewFailure(error: 'oops')),
        );
      });
    });
  });
}
