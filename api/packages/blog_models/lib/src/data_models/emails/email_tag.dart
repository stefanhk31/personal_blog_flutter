import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class EmailTag {
  final String name;
  final String value;

  EmailTag({required this.name, required this.value});
}
