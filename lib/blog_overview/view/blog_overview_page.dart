import 'package:blog_models/blog_models.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_blog_flutter/blog_overview/bloc/blog_overview_bloc.dart';
import 'package:personal_blog_flutter/blog_overview/widgets/widgets.dart';

class BlogOverviewPage extends StatelessWidget {
  const BlogOverviewPage({super.key});

  factory BlogOverviewPage.routeBuilder(
    _,
    __,
  ) =>
      const BlogOverviewPage(
        key: Key('blog_overview_page'),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BlogOverviewBloc(blogRepository: context.read<BlogRepository>())
            ..add(const BlogOverviewPostsRequested()),
      child: const BlogOverview(),
    );
  }
}

class BlogOverview extends StatelessWidget {
  const BlogOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogOverviewBloc, BlogOverviewState>(
      builder: (context, state) => switch (state) {
        BlogOverviewInitial() || BlogOverviewLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        BlogOverviewFailure(error: final error) => Center(
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
        BlogOverviewLoaded(previews: final previews) => _BlogOverviewContent(
            previews: previews,
          )
      },
    );
  }
}

class _BlogOverviewContent extends StatelessWidget {
  const _BlogOverviewContent({
    required this.previews,
  });

  final List<BlogPreview> previews;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: BlogSpacing.topMargin,
        child: Column(
          children: [
            const BlogOverviewHeader(),
            Expanded(
              child: Padding(
                padding: BlogSpacing.horizontalPadding,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: ListView.builder(
                    itemCount: previews.length,
                    itemBuilder: (context, index) {
                      final preview = previews[index];
                      return BlogCard(
                        title: preview.title,
                        subtitle: preview.description,
                        published: preview.published,
                        imageUrl: preview.image,
                        onTap: () {
                          context.go(
                            '/${preview.slug}',
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
