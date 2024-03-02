/// {@template blog_api_client_failure}
/// An exception thrown when an api request failure occurs.
/// {@endtemplate}
class BlogApiClientFailure implements Exception {
  /// {@macro blog_api_client_failure}
  const BlogApiClientFailure({
    required this.statusCode,
    required this.error,
  });

  /// The HTTP status code of this failure.
  final int statusCode;

  /// The error that caused this failure.
  final Object error;

  /// The response body of this failure.
  Map<String, dynamic> get body => {
        'error': error,
      };
}
