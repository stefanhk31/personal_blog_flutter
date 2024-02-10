part of 'blog_detail_bloc.dart';

sealed class BlogDetailState extends Equatable {
  const BlogDetailState();

  @override
  List<Object> get props => [];
}

final class BlogDetailInitial extends BlogDetailState {}

final class BlogDetailLoading extends BlogDetailState {}

final class BlogDetailFailure extends BlogDetailState {
  const BlogDetailFailure({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

final class BlogDetailLoaded extends BlogDetailState {
  const BlogDetailLoaded({required this.detail});

  final BlogDetail detail;

  @override
  List<Object> get props => [detail];
}
