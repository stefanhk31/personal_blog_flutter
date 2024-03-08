import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_blog_flutter/app/widgets/footer/bloc/bloc/footer_bloc.dart';
import 'package:personal_blog_flutter/utils/url_launcher.dart';

class _MockUrlLauncher extends Mock implements UrlLauncher {}

void main() {
  group('FooterBloc', () {
    late UrlLauncher urlLauncher;
    late FooterBloc bloc;

    setUp(() {
      urlLauncher = _MockUrlLauncher();
      bloc = FooterBloc(urlLauncher: urlLauncher);
    });
    test('can be instantiated', () {
      expect(
        bloc,
        isNotNull,
      );
    });

    test('can be instantiated without urlLauncher', () {
      expect(
        FooterBloc(),
        isNotNull,
      );
    });

    group('when FooterLinkClicked is added', () {
      const errorMessage = 'error';
      blocTest<FooterBloc, FooterState>(
        'does not emit state when link successfully launches',
        build: () => bloc,
        setUp: () {
          when(() => urlLauncher.validateUrl(url: any(named: 'url')))
              .thenAnswer((_) async => true);
          when(() => urlLauncher.launchUrl(url: any(named: 'url')))
              .thenAnswer((_) async {});
        },
        act: (bloc) => bloc.add(const FooterLinkClicked(url: 'url')),
        expect: () => <FooterState>[],
      );

      blocTest<FooterBloc, FooterState>(
        'emits FooterFailure when link fails to launch',
        build: () => bloc,
        setUp: () {
          when(() => urlLauncher.validateUrl(url: any(named: 'url')))
              .thenThrow(Exception(errorMessage));
        },
        act: (bloc) => bloc.add(const FooterLinkClicked(url: 'url')),
        expect: () => <FooterState>[
          const FooterFailure(error: 'Exception: $errorMessage'),
        ],
      );
    });
  });
}
