import 'package:blog_repository/blog_repository.dart';
import 'package:dart_frog/dart_frog.dart';

/// Request handler for the `/blogs/{slug}` route.
/// Supports GET requests.
Future<Response> onRequest(RequestContext context, String slug) async {
  return switch (context.request.method) {
    HttpMethod.get => await _get(context, slug),
    _ => Response(statusCode: 405, body: 'Method Not Allowed'),
  };
}

Future<Response> _get(RequestContext context, String slug) async {
  final (statusCode, html) =
      await context.read<BlogRepository>().getBlogDetailHtml(slug);

  return Response(
    statusCode: statusCode,
    body: html,
    headers: {'content-type': 'text/html'},
  );
}
