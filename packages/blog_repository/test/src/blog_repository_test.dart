// ignore_for_file: prefer_const_constructors
import 'package:blog_api_client/blog_api_client.dart';
import 'package:blog_models/blog_models.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockBlogApi extends Mock implements BlogApi {}

void main() {
  group('BlogRepository', () {
    final blogApi = _MockBlogApi();
    final blogRepository = BlogRepository(blogApi: blogApi);

    setUpAll(
      () {
        registerFallbackValue(BlogsRequest());
      },
    );

    test('can be instantiated', () {
      expect(
        blogRepository,
        isNotNull,
      );
    });

    group('getBlogPreviews', () {
      test('gets blog previews on successful api call', () async {
        when(() => blogApi.getBlogs(any(that: isA<BlogsRequest>())))
            .thenAnswer((_) async => _blogsResponse);

        expect(
          await blogRepository.getBlogPreviews(),
          equals(
            BlogPreviews(
              previews: _blogsResponse.data.map(BlogPreview.fromBlog).toList(),
              count: _blogsResponse.meta.count,
            ),
          ),
        );
      });

      test('rethrows on failed api call', () async {
        when(() => blogApi.getBlogs(any(that: isA<BlogsRequest>())))
            .thenThrow(Exception());

        expect(
          () async => blogRepository.getBlogPreviews(),
          throwsException,
        );
      });
    });

    group('getBlogDetail', () {
      test('gets blog detail on successful api call', () async {
        when(() => blogApi.getBlog(any(that: isA<String>())))
            .thenAnswer((_) async => _blogResponse);

        expect(
          await blogRepository.getBlogDetail(slug: 'slug'),
          equals(BlogDetail.fromBlog(_blogResponse.data)),
        );
      });

      test('rethrows on failed api call', () async {
        when(() => blogApi.getBlog(any(that: isA<String>())))
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
      categories: const [],
      tags: const [],
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
      categories: const [],
      tags: const [],
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
      categories: const [],
      tags: const [],
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
    categories: const [],
    tags: const [],
    featuredImageAlt: 'featuredImageAlt',
    slug: 'slug',
    title: 'title',
    summary: 'summary',
    seoTitle: 'seoTitle',
    metaDescription: 'metaDescription',
    status: 'status',
  ),
);
