import 'package:go_router/go_router.dart';
import 'package:personal_blog_flutter/blog_overview/view/blog_overview_page.dart';

GoRouter createRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => NoTransitionPage(
          child: BlogOverviewPage.routeBuilder(context, state),
        ),
      ),
    ],
  );
}
