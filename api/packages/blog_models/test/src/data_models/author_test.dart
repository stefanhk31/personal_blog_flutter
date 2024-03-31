// ignore_for_file: prefer_const_constructors

import 'package:blog_models/blog_models.dart';
import 'package:test/test.dart';

void main() {
  group('Author', () {
    test('can be instantiated', () {
      expect(
        author,
        isNotNull,
      );
    });

    test('can be instantiated with profileImage', () {
      expect(
        Author(
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
        ),
        isNotNull,
      );
    });

    test('supports value equality', () {
      expect(
        Author(
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
        ),
        equals(
          Author(
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
          ),
        ),
      );
    });

    group('JSON Serialization', () {
      test('can be created from JSON', () {
        expect(Author.fromJson(authorJson), isA<Author>());
      });

      test('can be mapped to JSON', () {
        expect(author.toJson(), equals(authorJson));
      });
    });
  });
}
