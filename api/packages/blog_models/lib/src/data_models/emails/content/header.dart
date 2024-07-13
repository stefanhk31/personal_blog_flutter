import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Header {
  String name;
  String value;

  Header({required this.name, required this.value});
}
