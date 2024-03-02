import 'package:blog_models/src/models/models.dart';
import 'package:test/test.dart';

void main() {
  group('Blog', () {
    test('can be instantiated', () {
      expect(blog, isNotNull);
    });

    test('supports value equality', () {
      expect(
        Blog(
          created: DateTime.now(),
          updated: DateTime.now(),
          published: DateTime.now(),
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
        equals(blog),
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
