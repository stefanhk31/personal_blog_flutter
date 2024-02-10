import 'package:blog_repository/blog_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_blog_flutter/blog_detail/bloc/blog_detail_bloc.dart';

import '../../helpers/constants.dart';

void main() {
  group('BlogDetailState', () {
    group('BlogDetailInitial', () {
      test('supports value comparisons', () {
        expect(BlogDetailInitial(), equals(BlogDetailInitial()));
      });
    });

    group('BlogDetailLoading', () {
      test('supports value comparisons', () {
        expect(BlogDetailLoading(), equals(BlogDetailLoading()));
      });
    });

    group('BlogDetailLoaded', () {
      test('supports value comparisons', () {
        expect(
          BlogDetailLoaded(detail: dummyBlogDetail),
          equals(BlogDetailLoaded(detail: dummyBlogDetail)),
        );
      });
    });
  });
}
