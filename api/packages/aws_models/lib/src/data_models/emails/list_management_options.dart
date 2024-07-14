import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_management_options.g.dart';

/// {@template list_management_options}
/// An object used to specify a list or topic to which an email belongs,
/// which will be used when a contact chooses to unsubscribe.
/// {@endtemplate}
@JsonSerializable()
class ListManagementOptions extends Equatable {
  /// {@macro list_management_options}
  const ListManagementOptions({
    required this.contactListName,
    required this.topicName,
  });

  /// Factory constructor for creating a new `ListManagementOptions` instance
  factory ListManagementOptions.fromJson(Map<String, dynamic> json) =>
      _$ListManagementOptionsFromJson(json);

  /// Serialize a `ListManagementOptions` instance to a map of JSON values.
  Map<String, dynamic> toJson() => _$ListManagementOptionsToJson(this);

  /// The name of the contact list to which the contact should be added.
  final String contactListName;

  /// The name of the topic to which the contact should be added.
  final String topicName;

  @override
  List<Object?> get props => [contactListName, topicName];
}
