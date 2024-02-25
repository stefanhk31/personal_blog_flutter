import 'dart:convert';

import 'package:blogs_data_source/blogs_data_source.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context, String slug) async {
  return switch (context.request.method) {
    HttpMethod.get => await _get(context, slug),
    _ => Response(statusCode: 405, body: 'Method Not Allowed'),
  };
}

Future<Response> _get(RequestContext context, String slug) async {
  final blog = await context.read<BlogsDataSource>().getBlog(slug);

  return Response(body: jsonEncode(blog.toJson()));
}
