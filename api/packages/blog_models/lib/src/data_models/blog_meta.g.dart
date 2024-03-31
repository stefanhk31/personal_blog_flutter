// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogMeta _$BlogMetaFromJson(Map<String, dynamic> json) => BlogMeta(
      nextPost: json['next_post'] == null
          ? null
          : BlogSummary.fromJson(json['next_post'] as Map<String, dynamic>),
      previousPost: json['previous_post'] == null
          ? null
          : BlogSummary.fromJson(json['previous_post'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BlogMetaToJson(BlogMeta instance) => <String, dynamic>{
      'next_post': instance.nextPost?.toJson(),
      'previous_post': instance.previousPost?.toJson(),
    };
