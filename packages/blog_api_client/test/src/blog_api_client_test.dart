// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'dart:io';

import 'package:blog_api_client/blog_api_client.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockHttpClient extends Mock implements Client {}

class _MockRequest extends Mock implements Request {}

void main() {
  group('BlogApiClient', () {
    late Client httpClient;
    late BlogApiClient blogApiClient;
    late Request request;

    setUpAll(() {
      registerFallbackValue(Request('GET', Uri()));
    });

    setUp(
      () {
        httpClient = _MockHttpClient();
        blogApiClient = BlogApiClient(
          innerClient: httpClient,
        );

        when(() => httpClient.send(any())).thenAnswer(
          (_) async => StreamedResponse(
            Stream.value(utf8.encode('')),
            HttpStatus.ok,
          ),
        );
        request = _MockRequest();
        when(() => request.headers).thenReturn({});
      },
    );

    test('can be instantiated', () {
      expect(
        BlogApiClient,
        isNotNull,
      );
    });

    group('send', () {
      test('adds content type and accept headers', () async {
        await blogApiClient.send(request);
        expect(
          request.headers,
          equals(
            {
              HttpHeaders.contentTypeHeader: ContentType.json.value,
              HttpHeaders.acceptHeader: ContentType.json.value,
            },
          ),
        );
      });
    });

    group('close', () {
      test('closes inner client on close', () {
        when(() => httpClient.close()).thenAnswer((_) {});
        blogApiClient.close();
        verify(() => httpClient.close()).called(1);
      });
    });
  });
}
