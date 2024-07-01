// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:blog_models/blog_models.dart';
import 'package:test/test.dart';

void main() {
  group('BlogPreviews', () {
    test('can be created from blogs response', () {
      final blogsResponse =
          BlogsResponse(meta: const BlogsMeta(count: 1), data: [blog]);

      final blogPreviews = BlogPreviews.fromBlogs(blogsResponse);

      expect(blogPreviews.count, equals(blogsResponse.meta.count));
      expect(blogPreviews.previews, hasLength(blogsResponse.data.length));
    });

    test('supports value equality', () {
      final instance1 = BlogPreviews(
        previews: [],
        count: 1,
      );

      final instance2 = BlogPreviews(
        previews: [],
        count: 1,
      );

      expect(instance1, equals(instance2));
    });
  });
}
