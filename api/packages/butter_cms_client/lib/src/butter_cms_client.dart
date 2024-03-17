import 'dart:io';

import 'package:http/http.dart';

/// {@template butter_cms_client}
/// Client to interact with the ButterCMS API.
/// {@endtemplate}
class ButterCmsClient {
  /// {@macro butter_cms_client}
  const ButterCmsClient({
    required Client httpClient,
    required String apiKey,
    String? baseUrl,
  })  : _httpClient = httpClient,
        _apiKey = apiKey,
        _baseUrl = baseUrl ?? 'api.buttercms.com';

  final Client _httpClient;
  final String _apiKey;
  final String _baseUrl;

  /// Fetches a list of blog posts from the ButterCMS API.
  Future<Response> fetchBlogPosts({
    bool excludeBody = false,
  }) async {
    final queryParameters = <String, dynamic>{
      'auth_token': Platform.environment['BUTTER_CMS_API_KEY'],
    };

    if (excludeBody) {
      queryParameters['exclude_body'] = 'true';
    }

    final uri = Uri.https(_baseUrl, '/v2/posts', queryParameters);

    return _httpClient.get(uri);
  }

  /// Fetches a single blog post from the ButterCMS API,
  /// given a unique [slug].
  Future<Response> fetchBlogPost({required String slug}) async {
    final queryParameters = <String, dynamic>{
      'auth_token': Platform.environment['BUTTER_CMS_API_KEY'],
    };

    final uri = Uri.https(_baseUrl, '/v2/posts/$slug', queryParameters);

    return _httpClient.get(uri);
  }
}
