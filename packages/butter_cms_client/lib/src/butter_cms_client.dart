import 'package:api_client/api_client.dart';
import 'package:butter_cms_client/src/models/blogs.dart';

/// {@template butter_cms_client}
/// Client to interact with the ButterCMS API.
/// {@endtemplate}
class ButterCmsClient {
  /// {@macro butter_cms_client}
  const ButterCmsClient({required ApiClient apiClient})
      : _apiClient = apiClient;

  final ApiClient _apiClient;

  /// Fetches a list of blog posts from the ButterCMS API.
  Future<Blogs> fetchBlogPosts() async {
    const butterCmsApiKey = String.fromEnvironment('BUTTER_CMS_API_KEY');
    return _apiClient.get(
      path: '/v2/posts?auth_token=$butterCmsApiKey',
      fromJson: Blogs.fromJson,
    );
  }
}