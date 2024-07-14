import 'package:aws_models/src/data_models/data_models.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_email_request.g.dart';

/// {@template send_email_request}
/// Data model for an API request to send an email.
/// {@endtemplate}
@JsonSerializable()
class SendEmailRequest extends Equatable {
  /// {@macro send_email_request}
  SendEmailRequest({
    required this.content,
    this.configurationSetName,
    this.destination,
    this.emailTags,
    this.feedbackForwardingEmailAddress,
    this.feedbackForwardingEmailAddressIdentityArn,
    this.fromEmailAddress,
    this.fromEmailAddressIdentityArn,
    this.listManagementOptions,
    this.replyToAddresses,
  });

  factory SendEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$SendEmailRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendEmailRequestToJson(this);

  final EmailContent content;
  final String? configurationSetName;
  final Destination? destination;
  final List<EmailTag>? emailTags;
  final String? feedbackForwardingEmailAddress;
  final String? feedbackForwardingEmailAddressIdentityArn;
  final String? fromEmailAddress;
  final String? fromEmailAddressIdentityArn;
  final ListManagementOptions? listManagementOptions;
  final List<String>? replyToAddresses;

  @override
  List<Object?> get props => [
        content,
        configurationSetName,
        destination,
        emailTags,
        feedbackForwardingEmailAddress,
        feedbackForwardingEmailAddressIdentityArn,
        fromEmailAddress,
        fromEmailAddressIdentityArn,
        listManagementOptions,
        replyToAddresses,
      ];
}
