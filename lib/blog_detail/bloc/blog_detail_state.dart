part of 'blog_detail_bloc.dart';

sealed class BlogDetailState extends Equatable {
  const BlogDetailState();

  @override
  List<Object> get props => [];
}

final class BlogDetailInitial extends BlogDetailState {
  const BlogDetailInitial();
}

final class BlogDetailLoading extends BlogDetailState {
  const BlogDetailLoading();
}

final class BlogDetailFailure extends BlogDetailState {
  const BlogDetailFailure({required this.error});

  final Object error;

  @override
  List<Object> get props => [error];
}

final class BlogDetailLoaded extends BlogDetailState {
  const BlogDetailLoaded({required this.detail});

  final BlogDetail detail;

  @override
  List<Object> get props => [detail];
}
