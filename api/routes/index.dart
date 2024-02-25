import 'dart:convert';

import 'package:blogs_data_source/blogs_data_source.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  return switch (context.request.method) {
    HttpMethod.get => await _get(context),
    _ => Response(statusCode: 405, body: 'Method Not Allowed'),
  };
}

Future<Response> _get(RequestContext context) async {
  final blogs = await context.read<BlogsDataSource>().getBlogs();

  return Response(body: jsonEncode(blogs.toJson()));
}
