import 'package:blog_models/src/data_models/emails/content/content.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class TemplateContent {
  List<Header> headers;
  String templateArn;
  String templateData;
  String templateName;

  TemplateContent(
      {required this.headers,
      required this.templateArn,
      required this.templateData,
      required this.templateName});
}
