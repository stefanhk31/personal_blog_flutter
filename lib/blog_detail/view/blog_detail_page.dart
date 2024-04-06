import 'package:blog_repository/blog_repository.dart';
import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_blog_flutter/blog_detail/bloc/blog_detail_bloc.dart';

class BlogDetailPage extends StatelessWidget {
  const BlogDetailPage({
    required this.slug,
    super.key,
  });

  factory BlogDetailPage.routeBuilder(_, GoRouterState state) => BlogDetailPage(
        slug: state.matchedLocation.substring(1),
        key: const Key('blog_detail_page'),
      );

  final String slug;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlogDetailBloc(
        blogRepository: context.read<BlogRepository>(),
        slug: slug,
      )..add(const BlogDetailRequested()),
      child: const BlogDetailView(),
    );
  }
}

class BlogDetailView extends StatelessWidget {
  const BlogDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogDetailBloc, BlogDetailState>(
      builder: (context, state) {
        // Coverage on switch is known issue: https://github.com/dart-lang/sdk/issues/54941
        // https://github.com/stefanhk31/personal_blog_flutter/issues/43
        // coverage:ignore-start
        return switch (state) {
          // coverage:ignore-end
          BlogDetailInitial() || BlogDetailLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          BlogDetailFailure(error: final error) => Center(
              child: Container(
                color: Theme.of(context).colorScheme.error,
                padding: BlogSpacing.allPadding,
                child: Text(
                  error.toString(),
                  style: BlogTextStyles.errorTextStyle.copyWith(
                    color: Theme.of(context).colorScheme.onError,
                  ),
                ),
              ),
            ),
          BlogDetailLoaded(detail: final detail) => BlogDetailContent(
              authorName:
                  '${detail.author.firstName} ${detail.author.lastName}',
              body: detail.body,
              published: detail.published,
              slug: detail.slug,
              title: detail.title,
              authorImage: detail.author.profileImage,
              featuredImage: detail.featuredImage,
              onLinkTap: (url, attributes, element) => context
                  .read<BlogDetailBloc>()
                  .add(BlogLinkClicked(url: url ?? '')),
            )
        };
      },
    );
  }
}
