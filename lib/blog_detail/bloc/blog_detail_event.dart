part of 'blog_detail_bloc.dart';

sealed class BlogDetailEvent extends Equatable {
  const BlogDetailEvent();

  @override
  List<Object> get props => [];
}

class BlogDetailRequested extends BlogDetailEvent {
  const BlogDetailRequested({required this.slug});

  final String slug;

  @override
  List<Object> get props => [slug];
}