import 'package:blog_models/blog_models.dart';
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
  ///
  /// If [excludeBody] is set, the call will return blogs
  /// without the HTML content of the body. This helps performance
  /// when fetching previews of numerous posts.
  ///
  /// [limit] and [offset] are used to paginate the list. [limit]
  /// is the maximum number of posts to return, and [offset] denotes
  /// how many posts to skip before beginning the fetch.
  Future<Response> fetchBlogPosts({
    bool excludeBody = false,
    int limit = defaultRequestLimit,
    int offset = defaultRequestOffset,
  }) async {
    final queryParameters = <String, dynamic>{
      'auth_token': _apiKey,
      'exclude_body': excludeBody.toString(),
      'limit': limit.toString(),
      'offset': offset.toString(),
    };

    final uri = Uri.https(_baseUrl, '/v2/posts', queryParameters);

    return _httpClient.get(uri);
  }

  /// Fetches a single blog post from the ButterCMS API,
  /// given a unique [slug].
  Future<Response> fetchBlogPost({required String slug}) async {
    final queryParameters = <String, dynamic>{
      'auth_token': _apiKey,
    };

    final uri = Uri.https(_baseUrl, '/v2/posts/$slug', queryParameters);

    return _httpClient.get(uri);
  }
}
