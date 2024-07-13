import 'package:blog_models/src/data_models/emails/content/content.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class EmailContent {
  RawContent? raw;
  SimpleContent? simple;
  TemplateContent? template;

  EmailContent({this.raw, this.simple, this.template});

  EmailContent.raw({required this.raw});

  EmailContent.simple({required this.simple});

  EmailContent.template({required this.template});
}
