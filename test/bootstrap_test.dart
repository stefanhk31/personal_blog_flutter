import 'package:flutter_test/flutter_test.dart';
import 'package:personal_blog_flutter/app/app.dart';
import 'package:personal_blog_flutter/bootstrap.dart';

void main() {
  group('buildApp', () {
    test('returns app', () async {
      expect(await buildApp('baseUrl'), isA<App>());
    });

    test('throws ArgumentError when baseUrl is empty', () {
      expect(() async => buildApp(''), throwsArgumentError);
    });
  });
}
