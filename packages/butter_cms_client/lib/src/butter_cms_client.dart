import 'package:api_client/api_client.dart';
import 'package:butter_cms_client/src/models/models.dart';

/// {@template butter_cms_client}
/// Client to interact with the ButterCMS API.
/// {@endtemplate}
class ButterCmsClient {
  /// {@macro butter_cms_client}
  const ButterCmsClient({required ApiClient apiClient})
      : _apiClient = apiClient;

  final ApiClient _apiClient;

  /// Fetches a list of blog posts from the ButterCMS API.
  Future<BlogsResponse> fetchBlogPosts({
    bool excludeBody = false,
  }) async {
    const butterCmsApiKey = String.fromEnvironment('BUTTER_CMS_API_KEY');

    final queryParameters = <String, dynamic>{
      'auth_token': butterCmsApiKey,
    };

    if (excludeBody) {
      queryParameters['exclude_body'] = 'true';
    }

    return _apiClient.get(
      path: '/v2/posts',
      queryParameters: queryParameters,
      fromJson: BlogsResponse.fromJson,
    );
  }

  /// Fetches a single blog post from the ButterCMS API,
  /// given a unique [slug].
  Future<BlogResponse> fetchBlogPost({required String slug}) async {
    const butterCmsApiKey = String.fromEnvironment('BUTTER_CMS_API_KEY');

    return _apiClient.get(
      path: '/v2/posts/$slug',
      queryParameters: <String, dynamic>{
        'auth_token': butterCmsApiKey,
      },
      fromJson: BlogResponse.fromJson,
    );
  }
}
