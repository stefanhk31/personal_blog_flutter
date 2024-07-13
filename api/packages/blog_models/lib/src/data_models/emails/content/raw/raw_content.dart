import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RawContent {
  String data;

  RawContent({required this.data});
}
