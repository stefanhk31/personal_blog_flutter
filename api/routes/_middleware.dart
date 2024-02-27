import 'dart:io';

import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:http/http.dart';

Handler middleware(Handler handler) {
  return handler.use(requestLogger()).use(
    provider<ButterCmsClient>(
      (_) {
        final apiKey = Platform.environment['butter_cms_api_key']!;

        if (apiKey.isEmpty) {
          throw Exception('ButterCMS API key is required');
        }

        return ButterCmsClient(
          httpClient: Client(),
          apiKey: Platform.environment['butter_cms_api_key'] ?? '',
        );
      },
    ),
  );
}
