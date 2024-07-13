import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class TextContent {
  String charset;
  String data;

  TextContent({required this.charset, required this.data});
}
