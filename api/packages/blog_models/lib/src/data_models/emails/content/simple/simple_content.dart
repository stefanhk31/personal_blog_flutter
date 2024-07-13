import 'package:blog_models/src/data_models/emails/content/content.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SimpleContent {
  SimpleBody body;
  List<Header> headers;
  Subject subject;

  SimpleContent({
    required this.body,
    required this.headers,
    required this.subject,
  });
}
