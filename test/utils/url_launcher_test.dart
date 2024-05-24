import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personal_blog_flutter/utils/url_launcher.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

class _MockUrlLauncherPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements UrlLauncherPlatform {}

class _FakeLaunchOptions extends Fake implements LaunchOptions {}

void main() {
  group('UrlLauncher', () {
    late UrlLauncherPlatform urlLauncherPlatform;
    late UrlLauncher urlLauncher;

    setUpAll(() {
      registerFallbackValue(_FakeLaunchOptions());
    });

    setUp(
      () {
        urlLauncherPlatform = _MockUrlLauncherPlatform();

        UrlLauncherPlatform.instance = urlLauncherPlatform;
        urlLauncher = UrlLauncher();

        when(() => urlLauncherPlatform.canLaunch(any()))
            .thenAnswer((_) async => true);
        when(() => urlLauncherPlatform.launchUrl(any(), any()))
            .thenAnswer((_) async => true);
      },
    );

    test('can validate url', () {
      const url = 'https://example.com';
      final result = urlLauncher.validateUrl(url: url);

      expect(result, completion(isTrue));
      verify(() => urlLauncherPlatform.canLaunch(url)).called(1);
    });

    test('can launch url', () {
      const url = 'https://example.com';
      final result = urlLauncher.launchUrl(url: url);

      expect(result, completion(isTrue));
      verify(() => urlLauncherPlatform.launchUrl(url, any())).called(1);
    });
  });
}
