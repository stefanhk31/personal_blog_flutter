import 'package:blog_repository/src/models/models.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:test/test.dart';

void main() {
  group('BlogPost', () {
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

      final blogPost = BlogPost.fromButter(blog);

      expect(blogPost.preview, equals(BlogPreview.fromButter(blog)));
      expect(blogPost.detail, equals(BlogDetail.fromButter(blog)));
    });

    test('supports value equality', () {
      final now = DateTime.now();
      final instance1 = BlogPost(
        preview: BlogPreview(
          title: 'title',
          description: 'description',
          published: now,
          authorName: 'authorName',
        ),
        detail: BlogDetail(
          title: 'title',
          published: now,
          body: 'body',
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
              profileImage: 'profileImage'),
          categories: const [],
          tags: const [],
          slug: 'slug',
          url: 'url',
          featuredImage: 'featuredImage',
          featuredImageAlt: 'featuredImageAlt',
        ),
      );

      final instance2 = BlogPost(
        preview: BlogPreview(
          title: 'title',
          description: 'description',
          published: now,
          authorName: 'authorName',
        ),
        detail: BlogDetail(
          title: 'title',
          published: now,
          body: 'body',
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
          slug: 'slug',
          url: 'url',
          featuredImage: 'featuredImage',
          featuredImageAlt: 'featuredImageAlt',
        ),
      );

      expect(instance1, equals(instance2));
    });
  });
}
