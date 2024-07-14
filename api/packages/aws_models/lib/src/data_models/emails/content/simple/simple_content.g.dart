// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimpleContent _$SimpleContentFromJson(Map<String, dynamic> json) =>
    SimpleContent(
      body: SimpleBody.fromJson(json['body'] as Map<String, dynamic>),
      headers: (json['headers'] as List<dynamic>)
          .map((e) => Header.fromJson(e as Map<String, dynamic>))
          .toList(),
      subject: Subject.fromJson(json['subject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SimpleContentToJson(SimpleContent instance) =>
    <String, dynamic>{
      'body': instance.body.toJson(),
      'headers': instance.headers.map((e) => e.toJson()).toList(),
      'subject': instance.subject.toJson(),
    };
