import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements Client {}

class FakeUri extends Fake implements Uri {}

class SampleRequest {
  SampleRequest({
    required this.test,
  });

  final String test;

  Map<String, dynamic> toJson() => <String, dynamic>{'test': test};
}

class SampleResponse {
  SampleResponse({
    required this.test,
  });

  factory SampleResponse.fromJson(Map<String, dynamic> json) =>
      SampleResponse(test: json['test'] as String);

  final String test;
}

typedef ApiClientMethod<T> = Future<T> Function();

void main() {
  group('ApiClient', () {
    late Client httpClient;
    late ApiClient apiClient;
    const json = '{"test":"test"}';

    Future<void> testHttpCall<T>(
      ApiClientMethod<T> apiMethod,
      Future<Response> Function() httpCallback,
    ) async {
      await apiMethod();
      verify(httpCallback).called(1);
    }

    void testRequestFailure<T>(
      HttpMethod method,
      int statusCode,
      TypeMatcher<T> expected,
    ) {
      Future<Response> Function() httpCallback;
      Function apiCallback;
      switch (method) {
        case HttpMethod.get:
          httpCallback =
              () => httpClient.get(any(), headers: any(named: 'headers'));
          apiCallback =
              () => apiClient.get(path: '', fromJson: SampleResponse.fromJson);
          break;
        case HttpMethod.post:
          final data = SampleRequest(test: 'test').toJson();
          httpCallback = () => httpClient.post(
                any(),
                headers: any(named: 'headers'),
                body: jsonEncode(data),
              );
          apiCallback = () => apiClient.post(
                path: '',
                fromJson: SampleResponse.fromJson,
                data: data,
              );
          break;
        case HttpMethod.put:
          final data = SampleRequest(test: 'test').toJson();
          httpCallback = () => httpClient.put(
                any(),
                headers: any(named: 'headers'),
                body: jsonEncode(data),
              );
          apiCallback = () => apiClient.put(
                path: '',
                fromJson: SampleResponse.fromJson,
                data: data,
              );
          break;
        case HttpMethod.delete:
          httpCallback = () => httpClient.delete(
                any(),
                headers: any(named: 'headers'),
              );
          apiCallback = () => apiClient.delete(
                path: '',
                fromJson: SampleResponse.fromJson,
              );
          break;
      }

      when(
        httpCallback,
      ).thenAnswer(
        (_) async => Response(json, statusCode),
      );
      expect(
        apiCallback,
        throwsA(expected),
      );
    }

    Future<void> testDeserialization(
      String json,
      ApiClientMethod<SampleResponse> method,
    ) async {
      final deserialized =
          SampleResponse.fromJson(jsonDecode(json) as Map<String, dynamic>);
      final result = await method();

      expect(result.test, equals(deserialized.test));
    }

    setUp(() {
      registerFallbackValue(FakeUri());
      httpClient = MockHttpClient();
      apiClient = ApiClient(baseUrl: '', client: httpClient, token: '');
    });

    test('can be instantiated', () {
      expect(ApiClient(baseUrl: ''), isNotNull);
    });

    group('GET', () {
      setUp(() {
        when(
          () => httpClient.get(any(), headers: any(named: 'headers')),
        ).thenAnswer(
          (_) async => Response(json, 200),
        );
      });

      test('successfully calls get', () async {
        await testHttpCall(
          () => apiClient.get(
            path: '',
            fromJson: SampleResponse.fromJson,
          ),
          () => httpClient.get(any(), headers: any(named: 'headers')),
        );
      });

      test('successfully calls get with query parameters', () async {
        await testHttpCall(
          () => apiClient.get(
            path: '',
            fromJson: SampleResponse.fromJson,
            queryParameters: {'test': 'test'},
          ),
          () => httpClient.get(any(), headers: any(named: 'headers')),
        );
      });

      test('successfully deserializes json', () async {
        await testDeserialization(
          json,
          () => apiClient.get(
            path: '',
            fromJson: SampleResponse.fromJson,
          ),
        );
      });

      group('Request Failures', () {
        test('400 throws Bad Request exception', () {
          testRequestFailure(HttpMethod.get, 400, isA<BadRequest>());
        });

        test('401 throws Unauthorized exception', () {
          testRequestFailure(HttpMethod.get, 401, isA<Unauthorized>());
        });

        test('404 throws Not Found exception', () {
          testRequestFailure(HttpMethod.get, 404, isA<NotFound>());
        });

        test('429 throws Too Many Requests exception', () {
          testRequestFailure(HttpMethod.get, 429, isA<TooManyRequests>());
        });

        test('500 throws Internal Server Error exception', () {
          testRequestFailure(
            HttpMethod.get,
            500,
            isA<InternalServerError>(),
          );
        });

        test('Unexpected HTTP failure throws a generic failure exception', () {
          testRequestFailure(HttpMethod.get, 502, isA<ApiRequestFailure>());
        });
      });
    });

    group('POST', () {
      final data = SampleRequest(test: 'test').toJson();
      final body = jsonEncode(data);

      setUp(() {
        when(
          () => httpClient.post(
            any(),
            headers: any(named: 'headers'),
            body: body,
          ),
        ).thenAnswer(
          (_) async => Response(json, 200),
        );
      });

      test('successfully calls post', () async {
        await testHttpCall(
          () => apiClient.post(
            path: '',
            fromJson: SampleResponse.fromJson,
            data: data,
          ),
          () => httpClient.post(
            any(),
            headers: any(named: 'headers'),
            body: body,
          ),
        );
      });

      test('successfully deserializes json', () async {
        await testDeserialization(
          json,
          () => apiClient.post(
            path: '',
            fromJson: SampleResponse.fromJson,
            data: data,
          ),
        );
      });

      group('Request Failures', () {
        test('400 throws Bad Request exception', () {
          testRequestFailure(HttpMethod.post, 400, isA<BadRequest>());
        });

        test('401 throws Unauthorized exception', () {
          testRequestFailure(HttpMethod.post, 401, isA<Unauthorized>());
        });

        test('404 throws Not Found exception', () {
          testRequestFailure(HttpMethod.post, 404, isA<NotFound>());
        });

        test('429 throws Too Many Requests exception', () {
          testRequestFailure(HttpMethod.post, 429, isA<TooManyRequests>());
        });

        test('500 throws Internal Server Error exception', () {
          testRequestFailure(
            HttpMethod.post,
            500,
            isA<InternalServerError>(),
          );
        });

        test('Unexpected HTTP failure throws a generic failure exception', () {
          testRequestFailure(
            HttpMethod.post,
            502,
            isA<ApiRequestFailure>(),
          );
        });
      });
    });

    group('PUT', () {
      final data = SampleRequest(test: 'test').toJson();
      final body = jsonEncode(data);

      setUp(() {
        when(
          () => httpClient.put(
            any(),
            headers: any(named: 'headers'),
            body: body,
          ),
        ).thenAnswer(
          (_) async => Response(json, 200),
        );
      });

      test('successfully calls put', () async {
        await testHttpCall(
          () => apiClient.put(
            path: '',
            fromJson: SampleResponse.fromJson,
            data: data,
          ),
          () => httpClient.put(
            any(),
            headers: any(named: 'headers'),
            body: body,
          ),
        );
      });

      test('successfully deserializes json', () async {
        await testDeserialization(
          json,
          () => apiClient.put(
            path: '',
            fromJson: SampleResponse.fromJson,
            data: data,
          ),
        );
      });
      group('Request Failures', () {
        test('400 throws Bad Request exception', () {
          testRequestFailure(HttpMethod.put, 400, isA<BadRequest>());
        });

        test('401 throws Unauthorized exception', () {
          testRequestFailure(HttpMethod.put, 401, isA<Unauthorized>());
        });

        test('404 throws Not Found exception', () {
          testRequestFailure(HttpMethod.put, 404, isA<NotFound>());
        });

        test('429 throws Too Many Requests exception', () {
          testRequestFailure(HttpMethod.put, 429, isA<TooManyRequests>());
        });

        test('500 throws Internal Server Error exception', () {
          testRequestFailure(
            HttpMethod.put,
            500,
            isA<InternalServerError>(),
          );
        });

        test('Unexpected HTTP failure throws a generic failure exception', () {
          testRequestFailure(HttpMethod.put, 502, isA<ApiRequestFailure>());
        });
      });
    });

    group('DELETE', () {
      setUp(() {
        when(
          () => httpClient.delete(any(), headers: any(named: 'headers')),
        ).thenAnswer(
          (_) async => Response(json, 200),
        );
      });

      test('successfully calls delete', () async {
        await testHttpCall(
          () => apiClient.delete(
            path: '',
            fromJson: SampleResponse.fromJson,
          ),
          () => httpClient.delete(any(), headers: any(named: 'headers')),
        );
      });

      test('successfully deserializes json', () async {
        await testDeserialization(
          json,
          () => apiClient.delete(
            path: '',
            fromJson: SampleResponse.fromJson,
          ),
        );
      });

      group('Request Failures', () {
        test('400 throws Bad Request exception', () {
          testRequestFailure(HttpMethod.delete, 400, isA<BadRequest>());
        });

        test('401 throws Unauthorized exception', () {
          testRequestFailure(HttpMethod.delete, 401, isA<Unauthorized>());
        });

        test('404 throws Not Found exception', () {
          testRequestFailure(HttpMethod.delete, 404, isA<NotFound>());
        });

        test('429 throws Too Many Requests exception', () {
          testRequestFailure(
            HttpMethod.delete,
            429,
            isA<TooManyRequests>(),
          );
        });

        test('500 throws Internal Server Error exception', () {
          testRequestFailure(
            HttpMethod.delete,
            500,
            isA<InternalServerError>(),
          );
        });

        test('Unexpected HTTP failure throws a generic failure exception', () {
          testRequestFailure(
            HttpMethod.delete,
            502,
            isA<ApiRequestFailure>(),
          );
        });
      });
    });
  });
}
