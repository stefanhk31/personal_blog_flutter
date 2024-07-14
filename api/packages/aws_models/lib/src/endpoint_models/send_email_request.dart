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
  const SendEmailRequest({
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

  /// Factory constructor for creating a new `SendEmailRequest` instance
  factory SendEmailRequest.fromJson(Map<String, dynamic> json) =>
      _$SendEmailRequestFromJson(json);

  /// Serialize a `SendEmailRequest` instance to a map of JSON values.
  Map<String, dynamic> toJson() => _$SendEmailRequestToJson(this);

  /// An object that contains the body of the message.
  final EmailContent content;

  /// Name of the configuration set to use when sending the email.
  final String? configurationSetName;

  /// An object that contains the recipients of the email message.
  final Destination? destination;

  /// A list of tags, in the form of name/value pairs, to apply to an email.
  /// Tags correspond to characteristics of the email that you define,
  /// so that you can publish email sending events.
  final List<EmailTag>? emailTags;

  /// The address that you want bounce and complaint
  /// notifications to be sent to.
  final String? feedbackForwardingEmailAddress;

  /// This parameter is used only for sending authorization.
  /// It is the ARN of the identity that is associated with
  /// the sending authorization policy that permits you
  /// to use the email address specified
  /// in the FeedbackForwardingEmailAddress parameter.
  ///
  /// For example, if the owner of example.com
  /// (which has ARN arn:aws:ses:us-east-1:123456789012:identity/example.com)
  /// attaches a policy to it that authorizes you to use feedback@example.com,
  /// then you would specify the FeedbackForwardingEmailAddressIdentityArn
  /// to be arn:aws:ses:us-east-1:123456789012:identity/example.com,
  /// and the FeedbackForwardingEmailAddress to be feedback@example.com.
  ///
  /// For more information about sending authorization,
  /// see the [Amazon SES Developer Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html).
  final String? feedbackForwardingEmailAddressIdentityArn;

  /// The email address to use as the "From" address for the email.
  /// The address that you specify has to be verified.
  final String? fromEmailAddress;

  /// This parameter is used only for sending authorization.
  /// It is the ARN of the identity that is associated with
  /// the sending authorization policy that permits you to use
  /// the email address specified in the FromEmailAddress parameter.
  /// For example, if the owner of example.com
  /// (which has ARN arn:aws:ses:us-east-1:123456789012:identity/example.com)
  /// attaches a policy to it that authorizes you to use sender@example.com,
  /// then you would specify the FromEmailAddressIdentityArn
  /// to be arn:aws:ses:us-east-1:123456789012:identity/example.com,
  /// and the FromEmailAddress to be sender@example.com.
  /// For more information about sending authorization,
  /// see the [Amazon SES Developer Guide](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html).

  final String? fromEmailAddressIdentityArn;

  /// An object used to specify a list or topic to which an email belongs,
  /// which will be used when a contact chooses to unsubscribe.
  final ListManagementOptions? listManagementOptions;

  /// The "Reply-to" email addresses for the message.
  /// When the recipient replies to the message,
  /// each Reply-to address receives the reply.
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
