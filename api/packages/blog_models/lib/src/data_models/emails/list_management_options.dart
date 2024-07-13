import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ListManagementOptions {
  ListManagementOptions(
      {required this.contactListName, required this.topicName});

  final String contactListName;
  final String topicName;
}
