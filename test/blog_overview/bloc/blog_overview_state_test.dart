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
          BlogOverviewLoaded(posts: const []),
          equals(BlogOverviewLoaded(posts: const [])),
        );
      });
    });

    group('BlogOverviewFailure', () {
      test('supports value comparisons', () {
        expect(
          BlogOverviewFailure(message: 'oops'),
          equals(BlogOverviewFailure(message: 'oops')),
        );
      });
    });
  });
}
