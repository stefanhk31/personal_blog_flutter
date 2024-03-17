import 'dart:convert';
import 'dart:io';

import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:http/http.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

Handler middleware(Handler handler) {
  return handler.use(requestLogger()).use(
    provider<ButterCmsClient>(
      (_) {
        var apiKey = Platform.environment['BUTTER_CMS_API_KEY'];

        if (apiKey != null) {
          final apiKeyMap = jsonDecode(apiKey) as Map<String, dynamic>;
          apiKey = apiKeyMap['BUTTER_CMS_API_KEY'] as String;
        }
        return ButterCmsClient(
          httpClient: Client(),
          apiKey: apiKey ?? '',
        );
      },
    ),
  ).use(
    fromShelfMiddleware(
      corsHeaders(
        headers: {
          ACCESS_CONTROL_ALLOW_ORIGIN:
              Platform.environment['CORS_ALLOW_ORIGIN'] ?? '',
        },
      ),
    ),
  );
}
