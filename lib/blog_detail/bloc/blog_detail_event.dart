part of 'blog_detail_bloc.dart';

sealed class BlogDetailEvent {}

class BlogDetailRequested extends BlogDetailEvent {}

class BlogLinkClicked extends BlogDetailEvent {
  BlogLinkClicked(this.url);

  final String url;
}
