// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogSummary _$BlogSummaryFromJson(Map<String, dynamic> json) => BlogSummary(
      slug: json['slug'] as String,
      title: json['title'] as String,
      featuredImage: json['featured_image'] as String,
    );

Map<String, dynamic> _$BlogSummaryToJson(BlogSummary instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'title': instance.title,
      'featured_image': instance.featuredImage,
    };
