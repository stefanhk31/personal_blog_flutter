// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_email_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendEmailRequest _$SendEmailRequestFromJson(Map<String, dynamic> json) =>
    SendEmailRequest(
      content: EmailContent.fromJson(json['content'] as Map<String, dynamic>),
      configurationSetName: json['configurationSetName'] as String?,
      destination: json['destination'] == null
          ? null
          : Destination.fromJson(json['destination'] as Map<String, dynamic>),
      emailTags: (json['emailTags'] as List<dynamic>?)
          ?.map((e) => EmailTag.fromJson(e as Map<String, dynamic>))
          .toList(),
      feedbackForwardingEmailAddress:
          json['feedbackForwardingEmailAddress'] as String?,
      feedbackForwardingEmailAddressIdentityArn:
          json['feedbackForwardingEmailAddressIdentityArn'] as String?,
      fromEmailAddress: json['fromEmailAddress'] as String?,
      fromEmailAddressIdentityArn:
          json['fromEmailAddressIdentityArn'] as String?,
      listManagementOptions: json['listManagementOptions'] == null
          ? null
          : ListManagementOptions.fromJson(
              json['listManagementOptions'] as Map<String, dynamic>),
      replyToAddresses: (json['replyToAddresses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SendEmailRequestToJson(SendEmailRequest instance) =>
    <String, dynamic>{
      'content': instance.content,
      'configurationSetName': instance.configurationSetName,
      'destination': instance.destination,
      'emailTags': instance.emailTags,
      'feedbackForwardingEmailAddress': instance.feedbackForwardingEmailAddress,
      'feedbackForwardingEmailAddressIdentityArn':
          instance.feedbackForwardingEmailAddressIdentityArn,
      'fromEmailAddress': instance.fromEmailAddress,
      'fromEmailAddressIdentityArn': instance.fromEmailAddressIdentityArn,
      'listManagementOptions': instance.listManagementOptions,
      'replyToAddresses': instance.replyToAddresses,
    };
