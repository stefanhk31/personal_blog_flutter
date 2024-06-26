import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blog_api_client/blog_api_client.dart';
import 'package:blog_models/blog_models.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
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
      final previews = await _blogRepository.getBlogPreviews();
      emit(BlogOverviewLoaded(previews: previews));
    } on Exception catch (e) {
      if (e is BlogApiClientFailure) {
        emit(BlogOverviewFailure(error: e.body));
        return;
      }
      emit(BlogOverviewFailure(error: e.toString()));
    }
  }
}
