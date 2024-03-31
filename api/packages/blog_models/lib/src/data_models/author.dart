import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

/// {@template author}
/// Data model representing the author of a blog post.
/// {@endtemplate}
@JsonSerializable()
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
    this.profileImage,
  });

  /// Creates an [Author] instance from a JSON object.
  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  /// Converts the [Author] instance to a JSON object.
  Map<String, dynamic> toJson() => _$AuthorToJson(this);

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
  final String? profileImage;

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
}
