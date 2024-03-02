/// {@template blog_api_client_malformed_response}
/// An exception thrown when a malformed response is received from the api.
/// {@endtemplate}
class BlogApiClientMalformedResponse implements Exception {
  /// {@macro blog_api_client_malformed_response}
  const BlogApiClientMalformedResponse({
    required this.error,
  });

  /// The error related to the malformed response.
  final Object error;
}
