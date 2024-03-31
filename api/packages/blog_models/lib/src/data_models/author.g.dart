// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      slug: json['slug'] as String,
      bio: json['bio'] as String,
      title: json['title'] as String,
      linkedinUrl: json['linkedin_url'] as String,
      facebookUrl: json['facebook_url'] as String,
      twitterHandle: json['twitter_handle'] as String,
      profileImage: json['profile_image'] as String?,
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'slug': instance.slug,
      'bio': instance.bio,
      'title': instance.title,
      'linkedin_url': instance.linkedinUrl,
      'facebook_url': instance.facebookUrl,
      'twitter_handle': instance.twitterHandle,
      'profile_image': instance.profileImage,
    };
