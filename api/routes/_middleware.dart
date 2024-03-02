import 'dart:io';

import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:http/http.dart';

Handler middleware(Handler handler) {
  return handler.use(requestLogger()).use(
    provider<ButterCmsClient>(
      (_) {
        final apiKey = Platform.environment['butter_cms_api_key'];

        return ButterCmsClient(
          httpClient: Client(),
          //DO NOT COMMIT YOUR API KEY
          apiKey: apiKey ?? '217069e9eb9b1fa88d049940c8120bbade3df202',
        );
      },
    ),
  );
}
