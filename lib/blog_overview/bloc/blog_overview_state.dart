part of 'blog_overview_bloc.dart';

@immutable
sealed class BlogOverviewState extends Equatable {
  const BlogOverviewState({this.currentOffset = 0});

  final int currentOffset;

  @override
  List<Object> get props => [currentOffset];
}

final class BlogOverviewInitial extends BlogOverviewState {}

final class BlogOverviewLoading extends BlogOverviewState {}

final class BlogOverviewFailure extends BlogOverviewState {
  const BlogOverviewFailure({
    required this.error,
  });
  final Object error;

  @override
  List<Object> get props => [error];
}

final class BlogOverviewLoaded extends BlogOverviewState {
  const BlogOverviewLoaded({
    required this.previews,
    super.currentOffset,
  });
  final List<BlogPreview> previews;

  @override
  List<Object> get props => [previews];
}
