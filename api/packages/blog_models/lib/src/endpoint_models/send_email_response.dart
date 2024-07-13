import 'package:json_annotation/json_annotation.dart';

part 'send_email_response.g.dart';

@JsonSerializable()
class SendEmailResponse {
  SendEmailResponse({
    required this.messageId,
  });

  factory SendEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$SendEmailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendEmailResponseToJson(this);

  final String messageId;
}
