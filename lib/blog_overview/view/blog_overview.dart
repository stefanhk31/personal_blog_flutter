import 'package:blog_repository/blog_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_blog_flutter/blog_overview/bloc/blog_overview_bloc.dart';

class BlogOverview extends StatelessWidget {
  const BlogOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BlogOverviewBloc(blogRepository: context.read<BlogRepository>()),
      child: BlocBuilder<BlogOverviewBloc, BlogOverviewState>(
        builder: (context, state) {
          return switch (state) {
            BlogOverviewInitial || BlogOverviewLoading => CircularProgressIndicator()
          }
          
          Container(
              // Add your widget code here
              );
        },
      ),
    );
  }
}
