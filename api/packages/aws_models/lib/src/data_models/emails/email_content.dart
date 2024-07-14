import 'package:aws_models/src/data_models/emails/content/content.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'email_content.g.dart';

/// {@template email_content}
/// An object that defines the entire content of the email,
/// including the message headers and the body content.
/// You can create a simple email message,
/// in which you specify the subject and the text and HTML versions
/// of the message body.
/// {@endtemplate}
@JsonSerializable()
class EmailContent extends Equatable {
  /// {@macro email_content}
  const EmailContent({required this.simple});

  /// Factory constructor for creating a new `EmailContent` instance
  factory EmailContent.fromJson(Map<String, dynamic> json) =>
      _$EmailContentFromJson(json);

  /// Serialize a `EmailContent` instance to a map of JSON values.
  Map<String, dynamic> toJson() => _$EmailContentToJson(this);

  /// The simple email message.
  /// The message consists of a subject and a message body.
  final SimpleContent simple;

  @override
  List<Object?> get props => [simple];
}
