import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Subject {
  String charset;
  String data;

  Subject({required this.charset, required this.data});
}
