import 'dart:io';

import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:http/http.dart';

Handler middleware(Handler handler) {
  return handler.use(requestLogger()).use(
    provider<ButterCmsClient>(
      (_) {
        final apiKey = Platform.environment['BUTTER_CMS_API_KEY'];

        return ButterCmsClient(
          httpClient: Client(),
          apiKey: apiKey ?? '',
        );
      },
    ),
  );
}
