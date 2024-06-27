part of 'blog_overview_bloc.dart';

@immutable
sealed class BlogOverviewEvent extends Equatable {
  const BlogOverviewEvent();

  @override
  List<Object> get props => [];
}

final class BlogOverviewInitialPostsRequested extends BlogOverviewEvent {
  const BlogOverviewInitialPostsRequested();
}

final class BlogOverviewAdditionalPostsRequested extends BlogOverviewEvent {
  const BlogOverviewAdditionalPostsRequested();
}
