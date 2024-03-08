import 'package:flutter_test/flutter_test.dart';
import 'package:personal_blog_flutter/app/bloc/app_bloc.dart';

void main() {
  group('AppEvent', () {
    group('FooterLinkClicked', () {
      test('supports value comparisons', () {
        expect(
          const FooterLinkClicked(url: 'url'),
          equals(const FooterLinkClicked(url: 'url')),
        );
      });
    });
  });
}
