import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_management_options.g.dart';

@JsonSerializable()
class ListManagementOptions extends Equatable {
  ListManagementOptions(
      {required this.contactListName, required this.topicName});

  final String contactListName;
  final String topicName;

  factory ListManagementOptions.fromJson(Map<String, dynamic> json) =>
      _$ListManagementOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$ListManagementOptionsToJson(this);

  @override
  List<Object?> get props => [contactListName, topicName];
}
