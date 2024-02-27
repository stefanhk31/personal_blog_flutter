import 'dart:io';

import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:http/http.dart';

import '../secrets.dart';

Handler middleware(Handler handler) {
  return handler.use(requestLogger()).use(
    provider<ButterCmsClient>(
      (_) {
        final apiKey =
            Platform.environment['butter_cms_api_key'] ?? butterCmsApiKey;

        return ButterCmsClient(
          httpClient: Client(),
          apiKey: apiKey ?? '',
        );
      },
    ),
  );
}
