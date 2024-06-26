import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:blog_api_client/blog_api_client.dart';
import 'package:blog_models/blog_models.dart';
import 'package:http/http.dart';

/// Generic type representing a JSON factory.
typedef FromJson<T> = T Function(Map<String, dynamic> json);

/// {@template blog_api}
/// An API used for interacting with the blog backend.
/// {@endtemplate}
class BlogApi {
  /// {@macro blog_api}
  BlogApi({required Client client, required String baseUrl})
      : _client = BlogApiClient(innerClient: client),
        _baseUrl = baseUrl;

  final BlogApiClient _client;
  final String _baseUrl;

  /// GET /blogs
  ///
  /// Returns a list of blogs, with a [BlogsRequest] to specify
  /// details for pagination/filtering.
  Future<BlogsResponse> getBlogs(BlogsRequest request) async => _sendRequest(
        uri: Uri.parse('$_baseUrl/blogs'),
        fromJson: BlogsResponse.fromJson,
        queryParameters: request.toJson(),
      );

  /// GET /blogs/{slug}
  ///
  /// Returns a blog with the given [slug].
  Future<BlogResponse> getBlog(String slug) async => _sendRequest(
        uri: Uri.parse('$_baseUrl/blogs/$slug'),
        fromJson: BlogResponse.fromJson,
      );

  Future<T> _sendRequest<T>({
    required Uri uri,
    required FromJson<T> fromJson,
    String method = 'GET',
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final requestUri = Uri(
        scheme: uri.scheme,
        host: uri.host,
        path: uri.path,
        queryParameters: queryParameters,
      );

      final request = Request(method.toUpperCase(), requestUri);

      final responseStream = await _client.send(request);
      final response = await Response.fromStream(responseStream);
      final responseBody = response.json;

      if (response.statusCode >= 400) {
        throw BlogApiClientFailure(
          statusCode: response.statusCode,
          error: responseBody,
        );
      }

      return fromJson(responseBody);
    } on BlogApiClientMalformedResponse {
      rethrow;
    } on BlogApiClientFailure {
      rethrow;
    } catch (e) {
      throw BlogApiClientFailure(
        statusCode: HttpStatus.internalServerError,
        error: e,
      );
    }
  }
}

extension on Response {
  Map<String, dynamic> get json {
    try {
      final decodedBody = utf8.decode(bodyBytes);
      return jsonDecode(decodedBody) as Map<String, dynamic>;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        BlogApiClientMalformedResponse(error: error),
        stackTrace,
      );
    }
  }
}
