// ignore_for_file: prefer_const_constructors

import 'package:blog_repository/src/models/models.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:test/test.dart';

void main() {
  group('BlogAuthor', () {
    test('can be created from an Author', () {
      const author = Author(
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
      );

      final blogAuthor = BlogAuthor.fromButter(author);

      expect(blogAuthor.firstName, equals(author.firstName));
      expect(blogAuthor.lastName, equals(author.lastName));
      expect(blogAuthor.slug, equals(author.slug));
      expect(blogAuthor.bio, equals(author.bio));
      expect(blogAuthor.linkedinUrl, equals(author.linkedinUrl));
      expect(blogAuthor.facebookUrl, equals(author.facebookUrl));
      expect(blogAuthor.twitterUrl, equals(author.twitterHandle));
      expect(blogAuthor.profileImage, equals(author.profileImage));
    });

    test('supports value equality', () {
      final instance1 = BlogAuthor(
        firstName: 'firstName',
        lastName: 'lastName',
        slug: 'slug',
      );

      final instance2 = BlogAuthor(
        firstName: 'firstName',
        lastName: 'lastName',
        slug: 'slug',
      );

      expect(instance1, equals(instance2));
    });
  });
}
