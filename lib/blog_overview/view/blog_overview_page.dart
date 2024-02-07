import 'package:blog_repository/blog_repository.dart';
import 'package:blog_ui/blog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_blog_flutter/blog_overview/bloc/blog_overview_bloc.dart';

class BlogOverviewPage extends StatelessWidget {
  const BlogOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BlogOverviewBloc(blogRepository: context.read<BlogRepository>())
            ..add(BlogOverviewPostsRequested()),
      child: const BlogOverview(),
    );
  }
}

class BlogOverview extends StatelessWidget {
  const BlogOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogOverviewBloc, BlogOverviewState>(
      builder: (context, state) {
        return switch (state) {
          BlogOverviewInitial() || BlogOverviewLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          BlogOverviewFailure(message: final message) => Center(
              child: Text(message),
            ),
          BlogOverviewLoaded(posts: final posts) => _BlogOverviewContent(
              previews: posts.map((e) => e.preview).toList(),
            )
        };
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
    return Container(
      margin: BlogSpacing.topMargin,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: BlogSpacing.horizontalPadding,
              child: ListView.builder(
                itemCount: previews.length,
                itemBuilder: (context, index) {
                  final preview = previews[index];
                  return BlogCard(
                    title: preview.title,
                    subtitle: preview.description,
                    author: preview.authorName,
                    authorImage: preview.authorImage,
                    imageUrl: preview.image,
                    // Coverage will be filled with detail page (#8)
                    // coverage:ignore-start
                    onTap: () {
                      final state = context.read<BlogOverviewBloc>().state
                          as BlogOverviewLoaded;
                      final post = state.posts
                          .where((element) => element.preview == preview)
                          .first;
                      debugPrint(post.detail.toString());
                    },
                    // coverage:ignore-end
                  );
                },
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                height: 75,
                child: Image.asset('images/butter_cms_black.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
