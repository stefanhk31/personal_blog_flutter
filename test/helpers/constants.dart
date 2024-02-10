import 'package:blog_repository/blog_repository.dart';

const failureMessage = 'oops';

final dummyBlogDetail = BlogDetail(
  title: 'title',
  published: DateTime.now(),
  body: 'body',
  slug: 'slug',
  author: const BlogAuthor(
    firstName: 'firstName',
    lastName: 'lastName',
    slug: 'slug',
    bio: 'bio',
    linkedinUrl: 'linkedinUrl',
    facebookUrl: 'facebookUrl',
  ),
  tags: const [],
  categories: const [],
);
