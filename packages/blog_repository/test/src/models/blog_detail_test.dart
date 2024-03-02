import 'package:blog_models/blog_models.dart';
import 'package:blog_repository/src/models/models.dart';
import 'package:test/test.dart';

void main() {
  group('BlogDetail', () {
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
        categories: const [],
        tags: const [],
        featuredImageAlt: 'featuredImageAlt',
        slug: 'slug',
        title: 'title',
        body: 'body',
        summary: 'summary',
        seoTitle: 'seoTitle',
        metaDescription: 'metaDescription',
        status: 'status',
      );

      final blogDetail = BlogDetail.fromApi(blog);

      expect(blogDetail.title, equals(blog.title));
      expect(blogDetail.published, equals(blog.published));
      expect(blogDetail.body, equals(blog.body));
    });

    test('supports value equality', () {
      final published = DateTime.now();

      final instance1 = BlogDetail(
        title: 'title',
        published: published,
        body: 'body',
        author: const BlogAuthor(
          firstName: 'firstName',
          lastName: 'lastName',
          slug: 'slug',
          bio: 'bio',
          linkedinUrl: 'linkedinUrl',
          facebookUrl: 'facebookUrl',
          profileImage: 'profileImage',
        ),
        categories: const [],
        tags: const [],
        slug: 'slug',
        url: 'url',
        featuredImage: 'featuredImage',
        featuredImageAlt: 'featuredImageAlt',
      );

      final instance2 = BlogDetail(
        title: 'title',
        published: published,
        body: 'body',
        author: const BlogAuthor(
          firstName: 'firstName',
          lastName: 'lastName',
          slug: 'slug',
          bio: 'bio',
          linkedinUrl: 'linkedinUrl',
          facebookUrl: 'facebookUrl',
          profileImage: 'profileImage',
        ),
        categories: const [],
        tags: const [],
        slug: 'slug',
        url: 'url',
        featuredImage: 'featuredImage',
        featuredImageAlt: 'featuredImageAlt',
      );

      expect(instance1, equals(instance2));
    });
  });
}
