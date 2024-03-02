part of 'blog_overview_bloc.dart';

@immutable
sealed class BlogOverviewState extends Equatable {
  @override
  List<Object> get props => [];
}

final class BlogOverviewInitial extends BlogOverviewState {}

final class BlogOverviewLoading extends BlogOverviewState {}

final class BlogOverviewFailure extends BlogOverviewState {
  BlogOverviewFailure({required this.error});
  final Object error;

  @override
  List<Object> get props => [error];
}

final class BlogOverviewLoaded extends BlogOverviewState {
  BlogOverviewLoaded({required this.previews});
  final List<BlogPreview> previews;

  @override
  List<Object> get props => [previews];
}
