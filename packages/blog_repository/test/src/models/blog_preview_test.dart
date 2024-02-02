import 'dart:math';

import 'package:blog_repository/src/models/models.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:test/test.dart';

void main() {
  group('BlogPreview', () {
    test('can be created from blog', () {
      final blog = Blog(
        url: 'url',
        created: DateTime.now(),
        updated: DateTime.now(),
        published: DateTime.now(),
        author: const Author(
          firstName: 'firstName',
          lastName: 'lastName',
          email: 'email',
          slug: 'slug',
          bio: 'bio',
          title: 'title',
          linkedinUrl: 'linkedinUrl',
          facebookUrl: 'facebookUrl',
          twitterHandle: 'twitterHandle',
          profileImage: 'profileImage',
        ),
        categories: [],
        tags: [],
        featuredImageAlt: 'featuredImageAlt',
        slug: 'slug',
        title: 'title',
        body: 'body',
        summary: 'summary',
        seoTitle: 'seoTitle',
        metaDescription: 'metaDescription',
        status: 'status',
      );

      final blogPreview = BlogPreview.fromButter(blog);

      expect(blogPreview.title, equals(blog.title));
      expect(blogPreview.authorImage, equals(blog.author.profileImage));
      expect(blogPreview.image, equals(blog.featuredImage));
      expect(blogPreview.published, equals(blog.published));
      expect(
        blogPreview.authorName,
        equals('${blog.author.firstName} ${blog.author.lastName}'),
      );
      expect(blogPreview.description, equals(blog.summary));
    });

    test('supports value equality', () {
      final instance1 = BlogPreview(
        title: 'title',
        description: 'description',
        published: DateTime.now(),
        authorName: 'authorName',
      );

      final instance2 = BlogPreview(
        title: 'title',
        description: 'description',
        published: DateTime.now(),
        authorName: 'authorName',
      );

      expect(instance1, equals(instance2));
    });
  });
}
