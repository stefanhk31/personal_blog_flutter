part of 'blog_overview_bloc.dart';

@immutable
sealed class BlogOverviewState extends Equatable {
  const BlogOverviewState({
    this.currentOffset = 0,
    this.loadingMoreItems = false,
  });

  final int currentOffset;
  final bool loadingMoreItems;

  @override
  List<Object> get props => [currentOffset, loadingMoreItems];
}

final class BlogOverviewInitial extends BlogOverviewState {
  const BlogOverviewInitial();
}

final class BlogOverviewLoading extends BlogOverviewState {
  const BlogOverviewLoading();
}

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
    super.loadingMoreItems,
  });
  final List<BlogPreview> previews;

  @override
  List<Object> get props => [previews];
}
