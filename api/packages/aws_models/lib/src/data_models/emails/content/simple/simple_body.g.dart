// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleBody _$SimpleBodyFromJson(Map<String, dynamic> json) => SimpleBody(
      html: json['html'] == null
          ? null
          : HtmlContent.fromJson(json['html'] as Map<String, dynamic>),
      text: json['text'] == null
          ? null
          : TextContent.fromJson(json['text'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SimpleBodyToJson(SimpleBody instance) =>
    <String, dynamic>{
      'html': instance.html,
      'text': instance.text,
    };
