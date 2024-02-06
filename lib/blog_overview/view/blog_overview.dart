import 'package:blog_repository/blog_repository.dart';
import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_blog_flutter/blog_overview/bloc/blog_overview_bloc.dart';

class BlogOverview extends StatelessWidget {
  const BlogOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BlogOverviewBloc(blogRepository: context.read<BlogRepository>())
            ..add(BlogOverviewPostsRequested()),
      child: BlocBuilder<BlogOverviewBloc, BlogOverviewState>(
        builder: (context, state) {
          return switch (state) {
            BlogOverviewInitial() ||
            BlogOverviewLoading() =>
              const CircularProgressIndicator(),
            BlogOverviewFailure(message: final message) => Center(
                child: Text(message),
              ),
            BlogOverviewLoaded(posts: final posts) => _BlogOverviewContent(
                previews: posts.map((e) => e.preview).toList(),
              )
          };
        },
      ),
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
    return SingleChildScrollView(
      child: Padding(
        padding: BlogSpacing.horizontalPadding,
        child: Column(
          children: previews.map((preview) {
            return BlogCard(
              title: preview.title,
              subtitle: preview.description,
              author: preview.authorName,
              onTap: () {
                final state = context.read<BlogOverviewBloc>().state
                    as BlogOverviewLoaded;
                final post = state.posts
                    .where((element) => element.preview == preview)
                    .first;
                debugPrint(post.detail.toString());
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
