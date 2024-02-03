part of 'blog_overview_bloc.dart';

@immutable
sealed class BlogOverviewState {}

final class BlogOverviewInitial extends BlogOverviewState {}

final class BlogOverviewLoading extends BlogOverviewState {}

final class BlogOverviewFailure extends BlogOverviewState {
  BlogOverviewFailure({required this.message});
  final String message;
}

final class BlogOverviewLoaded extends BlogOverviewState {
  BlogOverviewLoaded({required this.posts});
  final List<BlogPost> posts;
}
