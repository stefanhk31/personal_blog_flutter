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

const category = Category(name: 'name', slug: 'slug');

const tag = Tag(name: 'name', slug: 'slug');
