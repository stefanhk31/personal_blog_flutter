import 'package:blog_models/src/models/models.dart';
import 'package:test/test.dart';

import '../../helpers/fixtures.dart';

void main() {
  group('BlogResponse', () {
    final blogResponse = BlogResponse(
      meta: const BlogMeta(),
      data: Blog(
        created: DateTime.now(),
        updated: DateTime.now(),
        published: DateTime.now(),
        author: author,
        categories: [category],
        tags: [tag],
        featuredImageAlt: 'Blog Image',
        slug: 'my-blog-post',
        title: 'My Blog Post',
        summary: 'This is a summary of my blog post.',
        seoTitle: 'SEO Title',
        metaDescription: 'Meta Description',
        status: 'published',
      ),
    );

    test('can be instantiated', () {
      expect(blogResponse, isNotNull);
    });

    group('JSON serialization', () {
      final blogResponseJson = {
        'meta': {
          'next_post': null,
          'previous_post': null,
        },
        'data': {
          'url': null,
          'created': blogResponse.data.created.toIso8601String(),
          'updated': blogResponse.data.updated.toIso8601String(),
          'published': blogResponse.data.published.toIso8601String(),
          'author': authorJson,
          'categories': [categoryJson],
          'tags': [tagJson],
          'featured_image': blogResponse.data.featuredImage,
          'featured_image_alt': blogResponse.data.featuredImageAlt,
          'slug': blogResponse.data.slug,
          'title': blogResponse.data.title,
          'body': blogResponse.data.body,
          'summary': blogResponse.data.summary,
          'seo_title': blogResponse.data.seoTitle,
          'meta_description': blogResponse.data.metaDescription,
          'status': blogResponse.data.status,
        },
      };

      test('can create BlogResponse from JSON', () {
        expect(BlogResponse.fromJson(blogResponseJson), isA<BlogResponse>());
      });

      test('can map a BlogRespones to JSON', () {
        expect(blogResponse.toJson(), equals(blogResponseJson));
      });
    });
  });
}