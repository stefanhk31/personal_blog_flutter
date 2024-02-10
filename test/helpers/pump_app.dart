import 'package:blog_repository/blog_repository.dart';
import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:personal_blog_flutter/l10n/l10n.dart';

import 'helpers.dart';

class _MockBlogRepository extends Mock implements BlogRepository {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    BlogRepository? blogRepository,
    ThemeData? theme,
    GoRouter? router,
  }) {
    return mockNetworkImagesFor(
      () => pumpWidget(
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider<BlogRepository>.value(
              value: blogRepository ?? _MockBlogRepository(),
            ),
          ],
          child: MockGoRouterProvider(
            goRouter: router ?? MockGoRouter(),
            child: MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              theme: theme ?? BlogTheme.lightThemeData,
              home: Material(child: widget),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pumpAppWithRouter(
    GoRouter router, {
    BlogRepository? blogRepository,
    ThemeData? theme,
  }) {
    return mockNetworkImagesFor(
      () => pumpWidget(
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider<BlogRepository>.value(
              value: blogRepository ?? _MockBlogRepository(),
            ),
          ],
          child: MaterialApp.router(
            routerConfig: router,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: theme ?? BlogTheme.lightThemeData,
          ),
        ),
      ),
    );
  }
}
