import 'dart:convert';

import 'package:aws_common/aws_common.dart';
import 'package:aws_models/aws_models.dart';
import 'package:aws_signature_v4/aws_signature_v4.dart';

/// Default AWS Region that the client will use.
const defaultAwsRegion = 'us-east-1';

/// Service url for Amazon SES.
const sesServiceUrl = 'email.$defaultAwsRegion.amazonaws.com';

/// Generic type representing a JSON factory.
typedef FromJson<T> = T Function(Map<String, dynamic> json);

/// {@template aws_ses_client}
/// A client for interacting with AWS' Simple Email Service (SES).
/// {@endtemplate}
class AwsSesClient {
  /// {@macro aws_ses_client}
  AwsSesClient({
    AWSHttpClient? client,
    AWSSigV4Signer? signer,
    String? region,
  })  : _client = client ?? AWSHttpClient(),
        _scope = AWSCredentialScope(
          service: AWSService.ses,
          region: region ?? defaultAwsRegion,
        ),
        _signer = signer ?? const AWSSigV4Signer(),
        _baseUrl = sesServiceUrl;

  final AWSHttpClient _client;
  final AWSCredentialScope _scope;
  final AWSSigV4Signer _signer;
  final String _baseUrl;

  /// Sends an email using the Amazon SES API.
  Future<SendEmailResponse> sendEmail({
    required SendEmailRequest request,
  }) async =>
      _sendRequest(
        body: request.toJson(),
        path: 'v2/email/outbound-emails',
        fromJson: SendEmailResponse.fromJson,
      );

  Future<T> _sendRequest<T>({
    required FromJson<T> fromJson,
    required String path,
    Object? body,
    AWSHttpMethod method = AWSHttpMethod.post,
  }) async {
    final request = AWSHttpRequest(
      method: method,
      uri: Uri.parse('$_baseUrl/$path'),
      headers: const {
        AWSHeaders.host: sesServiceUrl,
        AWSHeaders.contentType: 'application/x-amz-json-1.1',
      },
      body: jsonEncode(body).codeUnits,
    );

    final signedRequest = await _signer.sign(request, credentialScope: _scope);

    final response = await signedRequest.send(client: _client).response;
    return fromJson(
      json.decode(await response.decodeBody()) as Map<String, dynamic>,
    );
  }
}
