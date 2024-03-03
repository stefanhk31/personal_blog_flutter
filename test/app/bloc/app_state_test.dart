// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:personal_blog_flutter/app/bloc/app_bloc.dart';

void main() {
  group('AppState', () {
    group('AppInitial', () {
      test('supports value comparisons', () {
        expect(AppInitial(), equals(AppInitial()));
      });
    });

    group('AppFailure', () {
      test('supports value comparisons', () {
        expect(AppFailure(error: 'error'), equals(AppFailure(error: 'error')));
      });
    });
  });
}
