import 'package:blog_models/blog_models.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:dart_frog/dart_frog.dart';

/// Request handler for the `/blogs` route.
/// Supports GET requests.
Future<Response> onRequest(RequestContext context, BlogsRequest request) async {
  return switch (context.request.method) {
    HttpMethod.get => await _get(context, request),
    _ => Response(statusCode: 405, body: 'Method Not Allowed'),
  };
}

Future<Response> _get(RequestContext context, BlogsRequest request) async {
  final blogsResponse =
      await context.read<ButterCmsClient>().fetchBlogPosts(request: request);

  return Response(
    statusCode: blogsResponse.statusCode,
    body: blogsResponse.body,
  );
}
