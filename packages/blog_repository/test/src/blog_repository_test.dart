// ignore_for_file: prefer_const_constructors
import 'package:blog_repository/blog_repository.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockButterCmsClient extends Mock implements ButterCmsClient {}

void main() {
  group('BlogRepository', () {
    test('can be instantiated', () {
      expect(
        BlogRepository(butterCmsClient: _MockButterCmsClient()),
        isNotNull,
      );
    });

    group('getBlogPreviews', () {
      final butterCmsClient = _MockButterCmsClient();
      final blogRepository = BlogRepository(butterCmsClient: butterCmsClient);
      test('gets blog previews on successful api call', () async {
        when(() => butterCmsClient.fetchBlogPosts(excludeBody: true))
            .thenAnswer((_) async => _blogs);

        expect(
          await blogRepository.getBlogPreviews(),
          equals(_blogs.data.map(BlogPreview.fromButter).toList()),
        );
      });

      test('rethrows on failed api call', () async {
        when(() => butterCmsClient.fetchBlogPosts(excludeBody: true))
            .thenThrow(Exception());

        expect(
          () async => blogRepository.getBlogPreviews(),
          throwsException,
        );
      });
    });
  });
}

final _blogs = Blogs(
  meta: Meta(count: 3),
  data: [
    Blog(
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
      summary: 'summary',
      seoTitle: 'seoTitle',
      metaDescription: 'metaDescription',
      status: 'status',
    ),
    Blog(
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
      summary: 'summary',
      seoTitle: 'seoTitle',
      metaDescription: 'metaDescription',
      status: 'status',
    ),
    Blog(
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
      summary: 'summary',
      seoTitle: 'seoTitle',
      metaDescription: 'metaDescription',
      status: 'status',
    ),
  ],
);
