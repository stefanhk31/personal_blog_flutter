// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blogs_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogsMeta _$BlogsMetaFromJson(Map<String, dynamic> json) => BlogsMeta(
      count: (json['count'] as num).toInt(),
      nextPage: (json['next_page'] as num?)?.toInt(),
      previousPage: (json['previous_page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BlogsMetaToJson(BlogsMeta instance) => <String, dynamic>{
      'count': instance.count,
      'next_page': instance.nextPage,
      'previous_page': instance.previousPage,
    };
