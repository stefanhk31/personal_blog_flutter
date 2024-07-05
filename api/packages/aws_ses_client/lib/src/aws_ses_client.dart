import 'package:aws_common/aws_common.dart';
import 'package:aws_signature_v4/aws_signature_v4.dart';

/// {@template aws_ses_client}
/// A client for interacting with AWS' Simple Email Service (SES).
/// {@endtemplate}
class AwsSesClient {
  /// {@macro aws_ses_client}
  AwsSesClient({
    AWSSigV4Signer? signer,
    String? region,
  })  : _scope = AWSCredentialScope(
          service: AWSService.ses,
          region: region ?? 'us-east-1',
        ),
        _signer = signer ?? const AWSSigV4Signer();

  final AWSCredentialScope _scope;
  final AWSSigV4Signer _signer;
}
