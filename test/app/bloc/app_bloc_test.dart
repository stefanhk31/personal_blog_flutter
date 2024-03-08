import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_blog_flutter/app/bloc/app_bloc.dart';
import 'package:personal_blog_flutter/utils/url_launcher.dart';

class _MockUrlLauncher extends Mock implements UrlLauncher {}

void main() {
  group('AppBloc', () {
    late UrlLauncher urlLauncher;
    late AppBloc bloc;

    setUp(() {
      urlLauncher = _MockUrlLauncher();
      bloc = AppBloc(urlLauncher: urlLauncher);
    });
    test('can be instantiated', () {
      expect(
        bloc,
        isNotNull,
      );
    });

    test('can be instantiated without urlLauncher', () {
      expect(
        AppBloc(),
        isNotNull,
      );
    });

    group('when FooterLinkClicked is added', () {
      const errorMessage = 'error';
      blocTest<AppBloc, AppState>(
        'does not emit state when link successfully launches',
        build: () => bloc,
        setUp: () {
          when(() => urlLauncher.validateUrl(url: any(named: 'url')))
              .thenAnswer((_) async => true);
          when(() => urlLauncher.launchUrl(url: any(named: 'url')))
              .thenAnswer((_) async {});
        },
        act: (bloc) => bloc.add(const FooterLinkClicked(url: 'url')),
        expect: () => <AppState>[],
      );

      blocTest<AppBloc, AppState>(
        'emits Appfailure when link fails to launch',
        build: () => bloc,
        setUp: () {
          when(() => urlLauncher.validateUrl(url: any(named: 'url')))
              .thenThrow(Exception(errorMessage));
        },
        act: (bloc) => bloc.add(const FooterLinkClicked(url: 'url')),
        expect: () => <AppState>[
          const AppFailure(error: 'Exception: $errorMessage'),
        ],
      );
    });
  });
}
