import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_blog_flutter/app/widgets/footer/cubit/footer_cubit.dart';
import 'package:personal_blog_flutter/utils/url_launcher.dart';

class _MockUrlLauncher extends Mock implements UrlLauncher {}

void main() {
  group('FooterCubit', () {
    late UrlLauncher urlLauncher;
    late FooterCubit cubit;

    setUp(() {
      urlLauncher = _MockUrlLauncher();
      cubit = FooterCubit(urlLauncher: urlLauncher);
    });
    test('can be instantiated', () {
      expect(
        cubit,
        isNotNull,
      );
    });

    test('can be instantiated without urlLauncher', () {
      expect(
        FooterCubit(),
        isNotNull,
      );
    });

    group('when FooterLinkClicked is added', () {
      const errorMessage = 'error';
      blocTest<FooterCubit, FooterState>(
        'does not emit state when link successfully launches',
        build: () => cubit,
        setUp: () {
          when(() => urlLauncher.validateUrl(url: any(named: 'url')))
              .thenAnswer((_) async => true);
          when(() => urlLauncher.launchUrl(url: any(named: 'url')))
              .thenAnswer((_) async {});
        },
        act: (cubit) async => cubit.launchFooterLink('url'),
        expect: () => <FooterState>[],
      );

      blocTest<FooterCubit, FooterState>(
        'emits FooterFailure when link fails to launch',
        build: () => cubit,
        setUp: () {
          when(() => urlLauncher.validateUrl(url: any(named: 'url')))
              .thenThrow(Exception(errorMessage));
        },
        act: (cubit) async => cubit.launchFooterLink('url'),
        expect: () => <FooterState>[
          const FooterFailure(error: 'Exception: $errorMessage'),
        ],
      );
    });
  });
}
