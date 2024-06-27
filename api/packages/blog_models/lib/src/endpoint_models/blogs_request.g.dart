// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blogs_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogsRequest _$BlogsRequestFromJson(Map<String, dynamic> json) => BlogsRequest(
      excludeBody: json['exclude_body'] == null
          ? true
          : BlogsRequest._boolFromQueryParameter(
              json['exclude_body'] as String),
      limit: json['limit'] == null
          ? 10
          : BlogsRequest._intFromQueryParameter(json['limit'] as String),
      offset: json['offset'] == null
          ? 0
          : BlogsRequest._intFromQueryParameter(json['offset'] as String),
      authorSlug: json['author_slug'] as String?,
      categorySlug: json['category_slug'] as String?,
      tagSlug: json['tag_slug'] as String?,
    );

Map<String, dynamic> _$BlogsRequestToJson(BlogsRequest instance) =>
    <String, dynamic>{
      'exclude_body': BlogsRequest._toQueryParameter(instance.excludeBody),
      'author_slug': BlogsRequest._toQueryParameter(instance.authorSlug),
      'category_slug': BlogsRequest._toQueryParameter(instance.categorySlug),
      'tag_slug': BlogsRequest._toQueryParameter(instance.tagSlug),
      'limit': BlogsRequest._toQueryParameter(instance.limit),
      'offset': BlogsRequest._toQueryParameter(instance.offset),
    };
