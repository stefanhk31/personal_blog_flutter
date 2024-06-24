// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blogs_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogsRequest _$BlogsRequestFromJson(Map<String, dynamic> json) => BlogsRequest(
      excludeBody: json['exclude_body'] as bool? ?? false,
      limit: json['limit'] as int? ?? 10,
      offset: json['offset'] as int? ?? 0,
      authorSlug: json['author_slug'] as String?,
      categorySlug: json['category_slug'] as String?,
      tagSlug: json['tag_slug'] as String?,
    );

Map<String, dynamic> _$BlogsRequestToJson(BlogsRequest instance) =>
    <String, dynamic>{
      'exclude_body': instance.excludeBody,
      'author_slug': instance.authorSlug,
      'category_slug': instance.categorySlug,
      'tag_slug': instance.tagSlug,
      'limit': instance.limit,
      'offset': instance.offset,
    };
