import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:meta/meta.dart';

part 'blog_overview_event.dart';
part 'blog_overview_state.dart';

class BlogOverviewBloc extends Bloc<BlogOverviewEvent, BlogOverviewState> {
  BlogOverviewBloc({required BlogRepository blogRepository})
      : _blogRepository = blogRepository,
        super(BlogOverviewInitial()) {
    on<BlogOverviewPostsRequested>(_onBlogOverviewPostsRequested);
  }

  final BlogRepository _blogRepository;

  FutureOr<void> _onBlogOverviewPostsRequested(
    BlogOverviewPostsRequested event,
    Emitter<BlogOverviewState> emit,
  ) async {
    emit(BlogOverviewLoading());
    try {
      final posts = await _blogRepository.getBlogPosts();
      emit(BlogOverviewLoaded(posts: posts));
    } on Exception catch (e) {
      emit(BlogOverviewFailure(message: e.toString()));
    }
  }
}
