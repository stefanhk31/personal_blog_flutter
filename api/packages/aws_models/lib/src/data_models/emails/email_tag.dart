import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'email_tag.g.dart';

/// {@template email_tag}
/// Contains the name and value of a tag that you apply
/// to an email. You can use message tags when you publish email
/// sending events.
/// {@endtemplate}
@JsonSerializable()
class EmailTag extends Equatable {
  /// {@macro email_tag}
  const EmailTag({required this.name, required this.value});

  /// Factory constructor for creating a new `EmailTag` instance
  factory EmailTag.fromJson(Map<String, dynamic> json) =>
      _$EmailTagFromJson(json);

  /// Serialize a `EmailTag` instance to a map of JSON values.
  Map<String, dynamic> toJson() => _$EmailTagToJson(this);

  /// The name of the message tag. The message tag name can only
  /// contain ASCII letters (a–z, A–Z), numbers (0–9),
  /// underscores (_), or dashes (-), and must contain no more
  /// than 256 characters.
  final String name;

  /// The value of the message tag. The message tag value can only
  /// contain ASCII letters (a–z, A–Z), numbers (0–9),
  /// underscores (_), or dashes (-), and must contain no more
  /// than 256 characters.
  final String value;

  @override
  List<Object?> get props => [name, value];
}
