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
        super(const BlogOverviewInitial()) {
    on<BlogOverviewInitialPostsRequested>(_onBlogOverviewPostsRequested);
    on<BlogOverviewAdditionalPostsRequested>(
        _onBlogOverviewAdditionalPostsRequested);
  }

  final BlogRepository _blogRepository;

  FutureOr<void> _onBlogOverviewPostsRequested(
    BlogOverviewInitialPostsRequested event,
    Emitter<BlogOverviewState> emit,
  ) async {
    emit(const BlogOverviewLoading());
    try {
      final previews =
          await _blogRepository.getBlogPreviews(offset: state.currentOffset);
      emit(
        BlogOverviewLoaded(
          previews: previews,
          currentOffset: state.currentOffset + previews.length,
        ),
      );
    } on Exception catch (e) {
      if (e is BlogApiClientFailure) {
        emit(BlogOverviewFailure(error: e.body));
        return;
      }
      emit(BlogOverviewFailure(error: e.toString()));
    }
  }

  FutureOr<void> _onBlogOverviewAdditionalPostsRequested(
    BlogOverviewAdditionalPostsRequested event,
    Emitter<BlogOverviewState> emit,
  ) async {
    if (state is! BlogOverviewLoaded) {
      emit(
        BlogOverviewFailure(
          error: Exception('Cannot call BlogOverviewAdditionalPostsRequested '
              'if state is not BlogOverviewLoaded'),
        ),
      );
    }

    final currentPreviews = (state as BlogOverviewLoaded).previews;
    emit(BlogOverviewLoadingAdditionalItems(previews: currentPreviews));

    final newPreviews = await _blogRepository.getBlogPreviews(
      offset: state.currentOffset,
    );

    final updatedPreviews = [...currentPreviews, ...newPreviews];

    emit(
      BlogOverviewLoaded(
        previews: updatedPreviews,
        currentOffset: state.currentOffset + updatedPreviews.length,
      ),
    );
  }
}
