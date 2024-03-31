import 'package:blog_models/blog_models.dart';
import 'package:test/test.dart';

void main() {
  group('Blog', () {
    test('can be instantiated', () {
      expect(blog, isNotNull);
    });

    test('supports value equality', () {
      final now = DateTime.now();
      expect(
        Blog(
          created: now,
          updated: now,
          published: now,
          author: author,
          categories: const [category],
          tags: const [tag],
          featuredImageAlt: 'Featured Image',
          slug: 'my-blog-post',
          title: 'My Blog Post',
          summary: 'This is a summary of my blog post.',
          seoTitle: 'SEO Title',
          metaDescription: 'Meta Description',
          status: 'published',
        ),
        equals(
          Blog(
            created: now,
            updated: now,
            published: now,
            author: author,
            categories: const [category],
            tags: const [tag],
            featuredImageAlt: 'Featured Image',
            slug: 'my-blog-post',
            title: 'My Blog Post',
            summary: 'This is a summary of my blog post.',
            seoTitle: 'SEO Title',
            metaDescription: 'Meta Description',
            status: 'published',
          ),
        ),
      );
    });

    group('JSON Serialization', () {
      test('can be created from JSON', () {
        expect(Blog.fromJson(blogJson), isA<Blog>());
      });

      test('can be mapped to JSON', () {
        expect(blog.toJson(), equals(blogJson));
      });
    });
  });
}
