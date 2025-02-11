import 'package:blog_html_builder/blog_html_builder.dart';
import 'package:blog_models/blog_models.dart';
import 'package:test/test.dart';

void main() {
  group('BlogDetailContent', () {
    group('html', () {
      test('returns a string with the blog detail content', () {
        final blogDetail = BlogDetail(
          title: blog.title,
          published: blog.published,
          body: blog.body ?? '',
          slug: blog.slug,
          author: author,
          tags: blog.tags,
          categories: blog.categories,
        );

        final blogDetailContent = BlogDetailContent(
          authorName:
              '${blogDetail.author.firstName} ${blogDetail.author.lastName}',
          body: blogDetail.body,
          published: blogDetail.published,
          title: blogDetail.title,
        );

        final result = blogDetailContent.html();
        expect(result, contains(blogDetail.title));
        expect(result, contains(blogDetail.body));
        expect(result, contains(blogDetail.author.firstName));
        expect(result, contains(blogDetail.author.lastName));
        expect(result, contains(blogDetail.published.year.toString()));
      });

      test('returns a string with author image when provided', () {
        final blogDetailWithAuthorImage = BlogDetail(
          title: blog.title,
          published: blog.published,
          body: blog.body ?? '',
          slug: blog.slug,
          author: author,
          tags: blog.tags,
          categories: blog.categories,
        );

        final blogDetailContent = BlogDetailContent(
          authorName: '${blogDetailWithAuthorImage.author.firstName} '
              '${blogDetailWithAuthorImage.author.lastName}',
          body: blogDetailWithAuthorImage.body,
          published: blogDetailWithAuthorImage.published,
          title: blogDetailWithAuthorImage.title,
          authorImage: blogDetailWithAuthorImage.author.profileImage ?? '',
        );

        expect(
          blogDetailContent.html(),
          contains(
            blogDetailWithAuthorImage.author.profileImage,
          ),
        );
      });

      test('returns a string with featured image when provided', () {
        final blogDetailWithFeaturedImage = BlogDetail(
          title: blog.title,
          published: blog.published,
          body: blog.body ?? '',
          slug: blog.slug,
          author: author,
          tags: blog.tags,
          categories: blog.categories,
          featuredImage: 'https://example.com/image.jpg',
        );

        final blogDetailContent = BlogDetailContent(
          authorName: '${blogDetailWithFeaturedImage.author.firstName} '
              '${blogDetailWithFeaturedImage.author.lastName}',
          body: blogDetailWithFeaturedImage.body,
          published: blogDetailWithFeaturedImage.published,
          title: blogDetailWithFeaturedImage.title,
          featuredImage: blogDetailWithFeaturedImage.featuredImage,
        );

        expect(
          blogDetailContent.html(),
          contains(
            blogDetailWithFeaturedImage.featuredImage,
          ),
        );
      });
    });
  });
}
