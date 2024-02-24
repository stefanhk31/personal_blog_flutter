import 'package:blog_repository/blog_repository.dart';
import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
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
        // coverage:ignore-start
        return switch (state) {
          // coverage:ignore-end
          BlogDetailInitial() || BlogDetailLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          BlogDetailFailure(message: final message) => Center(
              child: Container(
                color: Theme.of(context).colorScheme.error,
                padding: BlogSpacing.allPadding,
                child: Text(
                  message,
                  style: BlogTextStyles.errorTextStyle.copyWith(
                    color: Theme.of(context).colorScheme.onError,
                  ),
                ),
              ),
            ),
          BlogDetailLoaded(detail: final detail) =>
            _BlogDetailContent(detail: detail)
        };
      },
    );
  }
}

class _BlogDetailContent extends StatelessWidget {
  const _BlogDetailContent({required this.detail});

  final BlogDetail detail;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: BlogSpacing.horizontalPaddingLarge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (detail.featuredImage != null) ...[
              Center(
                child: Hero(
                  tag: detail.slug,
                  child: Image.network(
                    detail.featuredImage!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              BlogSpacing.mediumVerticalSpacing,
            ],
            AuthorTile(
              author: '${detail.author.firstName} ${detail.author.lastName}',
              authorImage: detail.author.profileImage,
            ),
            Text(
              DateFormat('MMMM d, yyyy').format(detail.published),
              style: BlogTextStyles.subtitleTextStyle.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
                fontStyle: FontStyle.italic,
              ),
            ),
            Html(
              data: '''
                ${detail.body}
              ''',
              style: {
                'p': Style(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                'h1': Style(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                'h2': Style(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                'h3': Style(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                'div': Style(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                'figcaption': Style(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                'a': Style(
                  color: Theme.of(context).colorScheme.primary,
                ),
              },
              // re-enable coverage after fixing flaky behavior
              // https://github.com/stefanhk31/personal_blog_flutter/issues/42
              // coverage:ignore-start
              onLinkTap: (url, attributes, element) => context
                  .read<BlogDetailBloc>()
                  .add(BlogLinkClicked(url: url ?? '')),
              // coverage:ignore-end
            ),
          ],
        ),
      ),
    );
  }
}
