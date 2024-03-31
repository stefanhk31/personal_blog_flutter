// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blogs_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogsMeta _$BlogsMetaFromJson(Map<String, dynamic> json) => BlogsMeta(
      count: json['count'] as int,
      nextPage: json['next_page'] as int?,
      previousPage: json['previous_page'] as int?,
    );

Map<String, dynamic> _$BlogsMetaToJson(BlogsMeta instance) => <String, dynamic>{
      'count': instance.count,
      'next_page': instance.nextPage,
      'previous_page': instance.previousPage,
    };
