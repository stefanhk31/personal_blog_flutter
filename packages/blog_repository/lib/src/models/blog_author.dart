import 'package:equatable/equatable.dart';

/// Represents the author of a blog post.
class BlogAuthor extends Equatable {
  /// Default constructor for a blog author.
  const BlogAuthor({
    required this.firstName,
    required this.lastName,
    required this.slug,
    this.bio,
    this.linkedinUrl,
    this.facebookUrl,
    this.twitterUrl,
    this.profileImage,
  });

  /// First name of the author.
  final String firstName;

  /// Last name of the author.
  final String lastName;

  /// Unique slug to search for the author.
  final String slug;

  /// Optional short biography of the author.
  final String? bio;

  /// Optional url of the author's LinkedIn profile.
  final String? linkedinUrl;

  /// Optional url of the author's Facebook profile.
  final String? facebookUrl;

  /// Optional url of the author's Twitter profile.
  final String? twitterUrl;

  /// Optional url of the author's profile image.
  final String? profileImage;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        slug,
        bio,
        linkedinUrl,
        facebookUrl,
        twitterUrl,
        profileImage,
      ];
}
