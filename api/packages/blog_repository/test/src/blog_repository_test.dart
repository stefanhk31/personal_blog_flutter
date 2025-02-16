// ignore_for_file: prefer_const_constructors
import 'package:blog_repository/blog_repository.dart';
import 'package:test/test.dart';

void main() {
  group('BlogRepository', () {
    test('can be instantiated', () {
      expect(BlogRepository(), isNotNull);
    });
  });
}
