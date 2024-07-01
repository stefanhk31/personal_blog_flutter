part of 'blog_overview_bloc.dart';

@immutable
sealed class BlogOverviewState extends Equatable {
  const BlogOverviewState({
    this.currentOffset = 0,
    this.count,
    this.hasReachedMax = false,
  });

  final int currentOffset;
  final int? count;
  final bool hasReachedMax;

  @override
  List<Object?> get props => [currentOffset, count, hasReachedMax];
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
    super.count,
    super.hasReachedMax,
  });
  final List<BlogPreview> previews;

  @override
  List<Object?> get props => [previews, currentOffset, count, hasReachedMax];
}

final class BlogOverviewLoadingAdditionalItems extends BlogOverviewState {
  const BlogOverviewLoadingAdditionalItems({
    required this.previews,
    super.currentOffset,
    super.count,
    super.hasReachedMax,
  });
  final List<BlogPreview> previews;

  @override
  List<Object?> get props => [previews, currentOffset, count, hasReachedMax];
}
