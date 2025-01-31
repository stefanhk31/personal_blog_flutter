import 'dart:convert';

import 'package:blog_models/blog_models.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
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
  final blogResponse =
      await context.read<ButterCmsClient>().fetchBlogPost(slug: slug);

  final blogObj = BlogResponse.fromJson(
    jsonDecode(blogResponse.body) as Map<String, dynamic>,
  );

  final blogBody = blogObj.data.body;

  return Response(
    statusCode: blogResponse.statusCode,
    body: blogBody,
    headers: {'content-type': 'text/html'},
  );
}
