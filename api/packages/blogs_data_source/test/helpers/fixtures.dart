import 'package:blog_models/blog_models.dart';

const author = Author(
  firstName: 'John',
  lastName: 'Doe',
  email: 'johndoe@example.com',
  slug: 'john-doe',
  bio: 'Lorem ipsum dolor sit amet',
  title: 'Software Engineer',
  linkedinUrl: 'https://www.linkedin.com/in/johndoe',
  facebookUrl: 'https://www.facebook.com/johndoe',
  twitterHandle: '@johndoe',
  profileImage: 'https://example.com/profile.jpg',
);

final authorJson = {
  'first_name': author.firstName,
  'last_name': author.lastName,
  'email': author.email,
  'slug': author.slug,
  'bio': author.bio,
  'title': author.title,
  'linkedin_url': author.linkedinUrl,
  'facebook_url': author.facebookUrl,
  'twitter_handle': author.twitterHandle,
  'profile_image': author.profileImage,
};

final blog = Blog(
  created: DateTime.now(),
  updated: DateTime.now(),
  published: DateTime.now(),
  author: author,
  categories: [category],
  tags: [tag],
  featuredImageAlt: 'Featured Image',
  slug: 'my-blog-post',
  title: 'My Blog Post',
  summary: 'This is a summary of my blog post.',
  seoTitle: 'SEO Title',
  metaDescription: 'Meta Description',
  status: 'published',
);

final blogJson = {
  'url': blog.url,
  'created': blog.created.toIso8601String(),
  'updated': blog.updated.toIso8601String(),
  'published': blog.published.toIso8601String(),
  'author': authorJson,
  'categories': [category.toJson()],
  'tags': [tag.toJson()],
  'featured_image': blog.featuredImage,
  'featured_image_alt': blog.featuredImageAlt,
  'slug': blog.slug,
  'title': blog.title,
  'body': blog.body,
  'summary': blog.summary,
  'seo_title': blog.seoTitle,
  'meta_description': blog.metaDescription,
  'status': blog.status,
};

const category = Category(name: 'name', slug: 'slug');

final categoryJson = {
  'name': 'name',
  'slug': 'slug',
};

const tag = Tag(name: 'name', slug: 'slug');

final tagJson = {
  'name': 'name',
  'slug': 'slug',
};
