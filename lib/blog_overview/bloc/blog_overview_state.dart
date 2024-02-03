part of 'blog_overview_bloc.dart';

@immutable
sealed class BlogOverviewState extends Equatable {
  @override
  List<Object> get props => [];
}

final class BlogOverviewInitial extends BlogOverviewState {}

final class BlogOverviewLoading extends BlogOverviewState {}

final class BlogOverviewFailure extends BlogOverviewState {
  BlogOverviewFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

final class BlogOverviewLoaded extends BlogOverviewState {
  BlogOverviewLoaded({required this.posts});
  final List<BlogPost> posts;

  @override
  List<Object> get props => [posts];
}
