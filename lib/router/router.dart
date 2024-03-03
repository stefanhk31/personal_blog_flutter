import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_blog_flutter/app/bloc/app_bloc.dart';
import 'package:personal_blog_flutter/app/widgets/footer.dart';
import 'package:personal_blog_flutter/blog_detail/view/blog_detail_page.dart';
import 'package:personal_blog_flutter/blog_overview/view/blog_overview_page.dart';

GoRouter createRouter() {
  return GoRouter(
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navgiationShell) => Scaffold(
          body: navgiationShell,
          bottomNavigationBar: Footer(onTap: () {
            context.read<AppBloc>().add(
                  const FooterLinkClicked(url: butterCmsLink),
                );
          }),
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
              GoRoute(
                path: '/:slug',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: BlogDetailPage.routeBuilder(context, state),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
