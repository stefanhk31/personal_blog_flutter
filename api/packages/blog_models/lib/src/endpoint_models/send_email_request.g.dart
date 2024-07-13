// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_email_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendEmailRequest _$SendEmailRequestFromJson(Map<String, dynamic> json) =>
    SendEmailRequest(
      content: EmailContent.fromJson(json['content'] as Map<String, dynamic>),
      configurationSetName: json['configuration_set_name'] as String?,
      destination: json['destination'] == null
          ? null
          : Destination.fromJson(json['destination'] as Map<String, dynamic>),
      emailTags: (json['email_tags'] as List<dynamic>?)
          ?.map((e) => EmailTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      feedbackForwardingEmailAddress:
          json['feedback_forwarding_email_address'] as String?,
      feedbackForwardingEmailAddressIdentityArn:
          json['feedback_forwarding_email_address_identity_arn'] as String?,
      fromEmailAddress: json['from_email_address'] as String?,
      fromEmailAddressIdentityArn:
          json['from_email_address_identity_arn'] as String?,
      listManagementOptions: json['list_management_options'] == null
          ? null
          : ListManagementOptions.fromJson(
              json['list_management_options'] as Map<String, dynamic>),
      replyToAddresses: (json['reply_to_addresses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SendEmailRequestToJson(SendEmailRequest instance) =>
    <String, dynamic>{
      'content': instance.content.toJson(),
      'configuration_set_name': instance.configurationSetName,
      'destination': instance.destination?.toJson(),
      'email_tags': instance.emailTags?.map((e) => e.toJson()).toList(),
      'feedback_forwarding_email_address':
          instance.feedbackForwardingEmailAddress,
      'feedback_forwarding_email_address_identity_arn':
          instance.feedbackForwardingEmailAddressIdentityArn,
      'from_email_address': instance.fromEmailAddress,
      'from_email_address_identity_arn': instance.fromEmailAddressIdentityArn,
      'list_management_options': instance.listManagementOptions?.toJson(),
      'reply_to_addresses': instance.replyToAddresses,
    };
