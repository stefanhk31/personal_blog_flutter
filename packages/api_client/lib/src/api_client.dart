import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

/// A function used to convert a json map into an object.
typedef FromJson<T> = T Function(Map<String, dynamic> json);

/// An enum of possible HTTP methods to handle.
enum HttpMethod {
  /// Denotes an HTTP GET method.
  get,

  /// Denotes an HTTP POST method.
  post,

  /// Denotes an HTTP PUT method.
  put,

  /// Denotes an HTTP DELETE method.
  delete,
}

/// {@template api_client}
/// A client to assist in making api calls
/// {@endtemplate}
class ApiClient {
  /// {@macro api_client}
  ApiClient({required String baseUrl, Client? client, String? token})
      : _baseUrl = baseUrl,
        _client = client ?? Client(),
        _token = token;

  /// The http client that will be making the calls
  final Client _client;

  /// Base url of the client's api calls. Format should be "www.example.com."
  /// NOTE: This will fail if you add the scheme (http/https) to the baseUrl.
  /// Add the host alone, and an https url will be generated.
  final String _baseUrl;

  /// Oauth2 token
  final String? _token;

  /// HTTP Get method
  Future<T> get<T>({
    required String path,
    required FromJson<T> fromJson,
  }) async {
    return _sendRequest(
      method: HttpMethod.get,
      path: path,
      fromJson: fromJson,
    );
  }

  /// HTTP Post method
  Future<T> post<T>({
    required String path,
    required FromJson<T> fromJson,
    Map<String, dynamic>? data,
  }) async {
    return _sendRequest(
      method: HttpMethod.post,
      path: path,
      fromJson: fromJson,
      data: data,
    );
  }

  /// HTTP Put method
  Future<T> put<T>({
    required String path,
    required FromJson<T> fromJson,
    Map<String, dynamic>? data,
  }) async {
    return _sendRequest(
      method: HttpMethod.put,
      path: path,
      fromJson: fromJson,
      data: data,
    );
  }

  /// HTTP Delete method
  Future<T> delete<T>({
    required String path,
    required FromJson<T> fromJson,
  }) async {
    return _sendRequest(
      method: HttpMethod.delete,
      path: path,
      fromJson: fromJson,
    );
  }

  Future<T> _sendRequest<T>({
    required HttpMethod method,
    required String path,
    required FromJson<T> fromJson,
    Map<String, dynamic>? data,
  }) async {
    Response response;
    final url = Uri.https(_baseUrl, path);
    final headers = _token != null ? {'authorization': 'Bearer $_token'} : null;
    final requestBody = data != null ? jsonEncode(data) : null;
    switch (method) {
      case HttpMethod.get:
        response = await _client.get(url, headers: headers);
        break;
      case HttpMethod.post:
        response = await _client.post(url, headers: headers, body: requestBody);
        break;
      case HttpMethod.put:
        response = await _client.put(url, headers: headers, body: requestBody);
        break;
      case HttpMethod.delete:
        response = await _client.delete(url, headers: headers);
        break;
    }

    if (response.statusCode >= 400) {
      _handleRequestFailure(response.statusCode, response.body);
    }

    final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
    return fromJson(responseBody);
  }

  void _handleRequestFailure(int statusCode, String body) {
    if (statusCode == HttpStatus.badRequest) {
      throw BadRequest(body: body);
    }
    if (statusCode == HttpStatus.unauthorized) {
      throw Unauthorized(body: body);
    }
    if (statusCode == HttpStatus.notFound) {
      throw NotFound(body: body);
    }
    if (statusCode == HttpStatus.tooManyRequests) {
      throw TooManyRequests(body: body);
    }
    if (statusCode == HttpStatus.internalServerError) {
      throw InternalServerError(body: body);
    }

    throw ApiRequestFailure(statusCode: statusCode, body: body);
  }
}

/// Base class for throwing an exception on an api request failure
class ApiRequestFailure implements Exception {
  /// Base constructor of api request failure
  ApiRequestFailure({
    required this.statusCode,
    required this.body,
  });

  /// Status code of request failure
  final int statusCode;

  /// Request body in raw JSON
  final String body;
}

/// Exception for Bad Request (400)
class BadRequest extends ApiRequestFailure {
  /// Constructor for bad request (400) failure
  BadRequest({
    required super.body,
    super.statusCode = 400,
  });
}

/// Exception for Unauthorized (401)
class Unauthorized extends ApiRequestFailure {
  /// Constructor for unauthorized (401) failure
  Unauthorized({
    required super.body,
    super.statusCode = 401,
  });
}

/// Exception for Not Found (404)
class NotFound extends ApiRequestFailure {
  /// Constructor for not found (404) failure
  NotFound({
    required super.body,
    super.statusCode = 404,
  });
}

/// Exception for Limit Reached (429)
class TooManyRequests extends ApiRequestFailure {
  /// Constructor for too many requests (429) failure
  TooManyRequests({
    required super.body,
    super.statusCode = 429,
  });
}

/// Exception for Internal Server Error (500)
class InternalServerError extends ApiRequestFailure {
  /// Constructor for internal server error (500) failure
  InternalServerError({
    required super.body,
    super.statusCode = 500,
  });
}
