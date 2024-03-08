import 'package:blog_repository/blog_repository.dart';
import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
      child: MaterialApp.router(
        routerConfig: widget.router ?? createRouter(),
        theme: BlogTheme.lightThemeData,
        darkTheme: BlogTheme.darkThemeData,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
