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

  Style _style({
    Color? color,
    TextStyle? textStyle,
  }) {
    return Style(
      color: color,
      fontSize:
          textStyle?.fontSize != null ? FontSize(textStyle!.fontSize!) : null,
      fontStyle: textStyle?.fontStyle,
      fontWeight: textStyle?.fontWeight,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: BlogSpacing.horizontalPaddingLarge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (detail.featuredImage != null) ...[
              Row(
                children: [
                  Expanded(
                    child: FeaturedImage(
                      imageUrl: detail.featuredImage!,
                      imageTag: detail.slug,
                      constraints: const BoxConstraints(
                        maxHeight: 500,
                      ),
                    ),
                  ),
                ],
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
                color: Theme.of(context).colorScheme.secondary,
                fontStyle: FontStyle.italic,
              ),
            ),
            Html(
              data: '''
                ${detail.body}
              ''',
              style: {
                'p': _style(
                  color: theme.colorScheme.primary,
                  textStyle: BlogTextStyles.detailBodyTextStyle,
                ),
                'h1': _style(
                  color: theme.colorScheme.primary,
                  textStyle: BlogTextStyles.headerTextStyle,
                ),
                'h2': _style(
                  color: theme.colorScheme.primary,
                  textStyle: BlogTextStyles.headerSubtitleTextStyle,
                ),
                'h3': _style(
                  color: theme.colorScheme.primary,
                  textStyle: BlogTextStyles.cardTitle,
                ),
                'div': _style(color: theme.colorScheme.primary),
                'figcaption': _style(
                  color: theme.colorScheme.primary,
                  textStyle: BlogTextStyles.footerTextStyle,
                ),
                'a': _style(
                  color: theme.colorScheme.secondary,
                  textStyle: BlogTextStyles.detailBodyTextStyle,
                ),
              },
              onLinkTap: (url, attributes, element) => context
                  .read<BlogDetailBloc>()
                  .add(BlogLinkClicked(url: url ?? '')),
            ),
          ],
        ),
      ),
    );
  }
}
