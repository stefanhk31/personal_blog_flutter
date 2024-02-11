part of 'blog_detail_bloc.dart';

sealed class BlogDetailEvent extends Equatable {
  const BlogDetailEvent();

  @override
  List<Object> get props => [];
}

class BlogDetailRequested extends BlogDetailEvent {
  const BlogDetailRequested();
}

class BlogLinkClicked extends BlogDetailEvent {
  const BlogLinkClicked({required this.url});

  final String url;

  @override
  List<Object> get props => [url];
}
