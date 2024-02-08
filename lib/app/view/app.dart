import 'package:blog_repository/blog_repository.dart';
import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_blog_flutter/app/widgets/widgets.dart';
import 'package:personal_blog_flutter/blog_overview/view/blog_overview_page.dart';
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
        theme: BlogTheme.lightThemeData,
        darkTheme: BlogTheme.darkThemeData,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const Scaffold(
          body: BlogOverviewPage(),
          bottomNavigationBar: Footer(),
        ),
      ),
    );
  }
}
