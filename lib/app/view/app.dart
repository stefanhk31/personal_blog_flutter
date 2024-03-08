import 'package:blog_repository/blog_repository.dart';
import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_blog_flutter/app/bloc/app_bloc.dart';
import 'package:personal_blog_flutter/l10n/l10n.dart';
import 'package:personal_blog_flutter/router/router.dart';

class App extends StatefulWidget {
  const App({
    required this.blogRepository,
    this.router,
    super.key,
  });

  final BlogRepository blogRepository;
  final GoRouter? router;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: widget.blogRepository),
      ],
      child: BlocProvider<AppBloc>(
        // fix coverage gap: https://github.com/stefanhk31/personal_blog_flutter/issues/55
        create: (context) => AppBloc(), // coverage:ignore-line
        child: AppView(router: widget.router ?? createRouter()),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  AppView({GoRouter? router, super.key}) : _router = router ?? createRouter();

  final GoRouter _router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: BlogTheme.lightThemeData,
      darkTheme: BlogTheme.darkThemeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
