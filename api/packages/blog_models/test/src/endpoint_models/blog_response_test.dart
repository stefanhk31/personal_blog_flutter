import 'package:blog_models/blog_models.dart';
import 'package:test/test.dart';

void main() {
  group('BlogResponse', () {
    final blogResponse = BlogResponse(
      meta: const BlogMeta(),
      data: blog,
    );

    test('can be instantiated', () {
      expect(blogResponse, isNotNull);
    });

    test('supports value equality', () {
      expect(
        BlogResponse(
          meta: const BlogMeta(),
          data: blog,
        ),
        equals(blogResponse),
      );
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
