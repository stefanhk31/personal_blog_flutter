import 'package:flutter_test/flutter_test.dart';
import 'package:personal_blog_flutter/blog_detail/bloc/blog_detail_bloc.dart';

void main() {
  group('BlogDetailEvent', () {
    group('BlogDetailRequested', () {
      test('supports value comparisons', () {
        expect(
          const BlogDetailRequested(),
          equals(
            const BlogDetailRequested(),
          ),
        );
      });
    });

    group('BlogLinkClicked', () {
      test('supports value comparisons', () {
        expect(
          const BlogLinkClicked(url: 'url'),
          equals(const BlogLinkClicked(url: 'url')),
        );
      });
    });
  });
}
