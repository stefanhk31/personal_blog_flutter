// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogResponse _$BlogResponseFromJson(Map<String, dynamic> json) => BlogResponse(
      meta: BlogMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: Blog.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BlogResponseToJson(BlogResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.toJson(),
    };
