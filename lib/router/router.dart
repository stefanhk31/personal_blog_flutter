import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_blog_flutter/app/widgets/footer.dart';
import 'package:personal_blog_flutter/blog_overview/view/blog_overview_page.dart';

GoRouter createRouter() {
  return GoRouter(
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navgiationShell) => Scaffold(
          body: navgiationShell,
          bottomNavigationBar: const Footer(),
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: BlogOverviewPage.routeBuilder(context, state),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
