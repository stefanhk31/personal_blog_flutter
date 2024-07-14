import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'header.g.dart';

@JsonSerializable()
class Header extends Equatable {
  Header({required this.name, required this.value});

  final String name;
  final String value;

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);

  Map<String, dynamic> toJson() => _$HeaderToJson(this);

  @override
  List<Object?> get props => [name, value];
}
