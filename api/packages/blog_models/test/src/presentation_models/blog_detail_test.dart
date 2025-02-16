import 'package:blog_models/blog_models.dart';
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

      final blogDetail = BlogDetail.fromBlog(blog);

      expect(blogDetail.title, equals(blog.title));
      expect(blogDetail.published, equals(blog.published));
      expect(blogDetail.body, equals(blog.body));
      expect(blogDetail.slug, equals(blog.slug));
      expect(blogDetail.url, equals(blog.url));
      expect(blogDetail.author, equals(blog.author));
      expect(blogDetail.tags, equals(blog.tags));
      expect(blogDetail.categories, equals(blog.categories));
      expect(blogDetail.featuredImage, equals(blog.featuredImage));
      expect(blogDetail.featuredImageAlt, equals(blog.featuredImageAlt));
      expect(blogDetail.seoTitle, equals(blog.seoTitle));
      expect(blogDetail.metaDescription, equals(blog.metaDescription));
      expect(blogDetail.authorName, equals('firstName lastName'));
      expect(blogDetail.publishDateFormatted, equals('January 1, 2021'));
    });

    test('supports value equality', () {
      final published = DateTime.now();

      final instance1 = BlogDetail(
        title: 'title',
        published: published,
        body: 'body',
        author: author,
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
        author: author,
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
