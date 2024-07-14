import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_email_response.g.dart';

/// {@template send_email_response}
/// The response object for the SendEmail operation.
/// {@endtemplate}
@JsonSerializable()
class SendEmailResponse extends Equatable {
  /// {@macro send_email_response}
  const SendEmailResponse({
    required this.messageId,
  });

  /// Factory constructor for creating a new `SendEmailResponse` instance
  factory SendEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$SendEmailResponseFromJson(json);

  /// Serialize a `SendEmailResponse` instance to a map of JSON values.
  Map<String, dynamic> toJson() => _$SendEmailResponseToJson(this);

  /// A unique identifier for the message
  /// that is generated when the message is accepted.
  final String messageId;

  @override
  List<Object?> get props => [messageId];
}
