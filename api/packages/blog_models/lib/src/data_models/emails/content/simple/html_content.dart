import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class HtmlContent {
  String charset;
  String data;

  HtmlContent({required this.charset, required this.data});
}
