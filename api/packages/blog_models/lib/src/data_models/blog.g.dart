// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Blog _$BlogFromJson(Map<String, dynamic> json) => Blog(
      created: DateTime.parse(json['created'] as String),
      updated: DateTime.parse(json['updated'] as String),
      published: DateTime.parse(json['published'] as String),
      author: Author.fromJson(json['author'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      featuredImageAlt: json['featured_image_alt'] as String,
      slug: json['slug'] as String,
      title: json['title'] as String,
      summary: json['summary'] as String,
      seoTitle: json['seo_title'] as String,
      metaDescription: json['meta_description'] as String,
      status: json['status'] as String,
      url: json['url'] as String?,
      body: json['body'] as String?,
      featuredImage: json['featured_image'] as String?,
    );

Map<String, dynamic> _$BlogToJson(Blog instance) => <String, dynamic>{
      'url': instance.url,
      'created': instance.created.toIso8601String(),
      'updated': instance.updated.toIso8601String(),
      'published': instance.published.toIso8601String(),
      'author': instance.author.toJson(),
      'categories': Blog._categoriesToJson(instance.categories),
      'tags': Blog._tagsToJson(instance.tags),
      'featured_image': instance.featuredImage,
      'featured_image_alt': instance.featuredImageAlt,
      'slug': instance.slug,
      'title': instance.title,
      'body': instance.body,
      'summary': instance.summary,
      'seo_title': instance.seoTitle,
      'meta_description': instance.metaDescription,
      'status': instance.status,
    };
