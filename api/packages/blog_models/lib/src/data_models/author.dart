import 'package:equatable/equatable.dart';

/// {@template author}
/// Data model representing the author of a blog post.
/// {@endtemplate}
class Author extends Equatable {
  /// {@macro author}
  const Author({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.slug,
    required this.bio,
    required this.title,
    required this.linkedinUrl,
    required this.facebookUrl,
    required this.twitterHandle,
    required this.profileImage,
  });

  /// Creates an [Author] instance from a JSON object.
  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      slug: json['slug'] as String,
      bio: json['bio'] as String,
      title: json['title'] as String,
      linkedinUrl: json['linkedin_url'] as String,
      facebookUrl: json['facebook_url'] as String,
      twitterHandle: json['twitter_handle'] as String,
      profileImage: json['profile_image'] as String,
    );
  }

  /// The first name of the author.
  final String firstName;

  /// The last name of the author.
  final String lastName;

  /// The email address of the author.
  final String email;

  /// The slug of the author.
  final String slug;

  /// The biography of the author.
  final String bio;

  /// The title of the author.
  final String title;

  /// The LinkedIn URL of the author.
  final String linkedinUrl;

  /// The Facebook URL of the author.
  final String facebookUrl;

  /// The Twitter handle of the author.
  final String twitterHandle;

  /// The profile image URL of the author.
  final String profileImage;

  @override
  List<Object?> get props {
    return [
      firstName,
      lastName,
      email,
      slug,
      bio,
      title,
      linkedinUrl,
      facebookUrl,
      twitterHandle,
      profileImage,
    ];
  }

  /// Converts the [Author] instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'slug': slug,
      'bio': bio,
      'title': title,
      'linkedin_url': linkedinUrl,
      'facebook_url': facebookUrl,
      'twitter_handle': twitterHandle,
      'profile_image': profileImage,
    };
  }
}
