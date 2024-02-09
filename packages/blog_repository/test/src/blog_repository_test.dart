// ignore_for_file: prefer_const_constructors
import 'package:blog_repository/blog_repository.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockButterCmsClient extends Mock implements ButterCmsClient {}

void main() {
  group('BlogRepository', () {
    final butterCmsClient = _MockButterCmsClient();
    final blogRepository = BlogRepository(butterCmsClient: butterCmsClient);
    test('can be instantiated', () {
      expect(
        blogRepository,
        isNotNull,
      );
    });

    group('getBlogPreviews', () {
      test('gets blog previews on successful api call', () async {
        when(() => butterCmsClient.fetchBlogPosts(excludeBody: true))
            .thenAnswer((_) async => _blogsResponse);

        expect(
          await blogRepository.getBlogPreviews(),
          equals(_blogsResponse.data.map(BlogPreview.fromButter).toList()),
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

    group('getBlogDetail', () {
      test('gets blog detail on successful api call', () async {
        when(() => butterCmsClient.fetchBlogPost(slug: any(named: 'slug')))
            .thenAnswer((_) async => _blogResponse);

        expect(
          await blogRepository.getBlogDetail(slug: 'slug'),
          equals(BlogDetail.fromButter(_blogResponse.data)),
        );
      });

      test('rethrows on failed api call', () async {
        when(() => butterCmsClient.fetchBlogPost(slug: any(named: 'slug')))
            .thenThrow(Exception());

        expect(
          () async => blogRepository.getBlogDetail(slug: 'slug'),
          throwsException,
        );
      });
    });
  });
}

final _blogsResponse = BlogsResponse(
  meta: BlogsMeta(count: 3),
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

final _blogResponse = BlogResponse(
  meta: BlogMeta(),
  data: Blog(
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
);
