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

    test('supports value equality', () {
      expect(
        const Author(
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
        equals(author),
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
