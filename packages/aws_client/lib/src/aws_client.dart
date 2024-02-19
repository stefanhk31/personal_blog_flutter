import 'dart:convert';

import 'package:encrypt/encrypt.dart';

/// {@template aws_client}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class AwsClient {
  /// {@macro aws_client}
  const AwsClient();

  String decrypt({
    required String secret,
    required String encryptionKey,
    required String initializationVector,
  }) {
    final key = Key.fromBase64(encryptionKey);
    final iv = IV.fromBase64(initializationVector);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

    final encryptedBytes = base64.decode(secret);
    final decryptedBytes =
        encrypter.decryptBytes(Encrypted(encryptedBytes), iv: iv);
    return utf8.decode(decryptedBytes);
  }
}
