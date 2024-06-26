import 'package:blog_models/blog_models.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:dart_frog/dart_frog.dart';

/// Request handler for the `/blogs` route.
/// Supports GET requests.
Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    HttpMethod.get => await _get(context),
    _ => Response(statusCode: 405, body: 'Method Not Allowed'),
  };
}

Future<Response> _get(RequestContext context) async {
  final queryParameters = context.request.uri.queryParameters;

  final excludeBody = (queryParameters['exclude_body'] ?? false) as bool;
  final limit = (queryParameters['limit'] ?? defaultRequestLimit) as int;
  final offset = (queryParameters['offset'] ?? defaultRequestOffset) as int;

  final blogsResponse = await context.read<ButterCmsClient>().fetchBlogPosts(
        excludeBody: excludeBody,
        limit: limit,
        offset: offset,
      );

  return Response(
    statusCode: blogsResponse.statusCode,
    body: blogsResponse.body,
  );
}
