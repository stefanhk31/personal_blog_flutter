part of 'blog_overview_bloc.dart';

@immutable
sealed class BlogOverviewEvent extends Equatable {
  const BlogOverviewEvent();

  @override
  List<Object> get props => [];
}

final class BlogOverviewPostsRequested extends BlogOverviewEvent {
  const BlogOverviewPostsRequested();
}
