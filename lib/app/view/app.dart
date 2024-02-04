import 'package:blog_repository/blog_repository.dart';
import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_blog_flutter/counter/counter.dart';
import 'package:personal_blog_flutter/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({
    required this.blogRepository,
    super.key,
  });

  final BlogRepository blogRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: blogRepository),
      ],
      child: MaterialApp(
        theme: BlogTheme.themeData,
        darkTheme: BlogTheme.themeData.copyWith(brightness: Brightness.dark),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const CounterPage(),
      ),
    );
  }
}
