import 'dart:convert';
import 'dart:io';

import 'package:blog_html_builder/blog_html_builder.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:http/http.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(
        provider<BlogRepository>(
          (context) => BlogRepository(
            cmsClient: context.read<ButterCmsClient>(),
            templateEngine: context.read<TemplateEngine>(),
          ),
        ),
      )
      .use(
        provider<TemplateEngine>(
          (_) => TemplateEngine(
            basePath:
                '${Directory.current.path}/packages/blog_repository/templates',
          ),
        ),
      )
      .use(
    provider<ButterCmsClient>(
      (_) {
        final secretJson = Platform.environment['BUTTER_CMS_API_KEY'];

        if (secretJson == null) {
          throw StateError('Could not fetch secret BUTTER_CMS_API_KEY');
        }

        final secret = jsonDecode(secretJson) as Map<String, dynamic>;
        final apiKey = secret['BUTTER_CMS_API_KEY'] as String?;

        if (apiKey == null) {
          throw StateError('Could not resolve apiKey value from secret');
        }

        return ButterCmsClient(
          httpClient: Client(),
          apiKey: apiKey,
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
