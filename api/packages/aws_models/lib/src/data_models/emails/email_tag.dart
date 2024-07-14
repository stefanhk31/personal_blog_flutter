import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'email_tag.g.dart';

@JsonSerializable()
class EmailTag extends Equatable {
  EmailTag({required this.name, required this.value});

  final String name;
  final String value;

  factory EmailTag.fromJson(Map<String, dynamic> json) =>
      _$EmailTagFromJson(json);

  Map<String, dynamic> toJson() => _$EmailTagToJson(this);

  @override
  List<Object?> get props => [name, value];
}
