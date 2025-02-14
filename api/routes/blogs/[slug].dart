import 'dart:convert';

import 'package:blog_html_builder/blog_html_builder.dart';
import 'package:blog_models/blog_models.dart';
import 'package:butter_cms_client/butter_cms_client.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:intl/intl.dart';

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

  final html = await BlogPage(
    templateEngine: TemplateEngine(
      context: {
        'metaContent': BlogMetaContent(
          templateEngine: TemplateEngine(
            context: {
              'title': defaultMetaTitle,
              'description': defaultMetaDescription,
            },
          ),
        ).html(),
        'innerHtml': BlogDetailContent(
          templateEngine: TemplateEngine(
            context: {
              'authorName': '${blogObj.data.author.firstName} '
                  '${blogObj.data.author.lastName}',
              'body': blogObj.data.body ?? '',
              'published': DateFormat.yMMMMd().format(blogObj.data.published),
              'title': blogObj.data.title,
              'authorImage': blogObj.data.author.profileImage,
              'featuredImage': blogObj.data.featuredImage,
            },
          ),
        ).html(),
        'footer': BlogFooter(
          templateEngine: TemplateEngine(
            context: {
              'year': DateTime.now().year,
            },
          ),
        ).html(),
      },
    ),
  ).html();

  return Response(
    statusCode: blogResponse.statusCode,
    body: html,
    headers: {'content-type': 'text/html'},
  );
}
