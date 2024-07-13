import 'dart:convert';

import 'package:aws_common/aws_common.dart';
import 'package:aws_signature_v4/aws_signature_v4.dart';

/// Default AWS Region that the client will use.
const defaultAwsRegion = 'us-east-1';

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
        // TODO(stefanhk31): confirm correct uri
        _uri = Uri.https('ses.${region ?? defaultAwsRegion}.amazon.com', '/');

  final AWSHttpClient _client;
  final AWSCredentialScope _scope;
  final AWSSigV4Signer _signer;
  final Uri _uri;

  Future<String> _sendRequest({
    required String target,
    AWSHttpMethod method = AWSHttpMethod.post,
    Object? body,
  }) async {
    final request = AWSHttpRequest(
      method: method,
      uri: _uri,
      headers: {
        // TODO(stefanhk31): confirm correct target
        AWSHeaders.target: 'AmazonSimpleEmailService.$target',
        // TODO(stefanhk31): confirm correct version
        AWSHeaders.contentType: 'application/x-amz-json-1.1',
      },
      body: jsonEncode(body).codeUnits,
    );

    final signedRequest = await _signer.sign(request, credentialScope: _scope);

    final response = await signedRequest.send(client: _client).response;
    // TODO(stefanhk31): return something other than raw string
    return response.decodeBody();
  }
}
