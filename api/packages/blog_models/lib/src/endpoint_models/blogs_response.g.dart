// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blogs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogsResponse _$BlogsResponseFromJson(Map<String, dynamic> json) =>
    BlogsResponse(
      meta: BlogsMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Blog.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlogsResponseToJson(BlogsResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta.toJson(),
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
