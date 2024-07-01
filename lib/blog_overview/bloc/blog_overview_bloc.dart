import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
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
    on<BlogOverviewInitialPostsRequested>(_onBlogOverviewInitialPostsRequested);
    on<BlogOverviewAdditionalPostsRequested>(
      _onBlogOverviewAdditionalPostsRequested,
      transformer: droppable(),
    );
  }

  final BlogRepository _blogRepository;

  FutureOr<void> _onBlogOverviewInitialPostsRequested(
    BlogOverviewInitialPostsRequested event,
    Emitter<BlogOverviewState> emit,
  ) async {
    emit(const BlogOverviewLoading());
    try {
      final response =
          await _blogRepository.getBlogPreviews(offset: state.currentOffset);
      emit(
        BlogOverviewLoaded(
          previews: response.previews,
          currentOffset: state.currentOffset + response.previews.length,
          count: response.count,
          hasReachedMax: response.previews.length >= response.count,
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
      return;
    }

    try {
      final currentPreviews = (state as BlogOverviewLoaded).previews;
      emit(
        BlogOverviewLoadingAdditionalItems(
          previews: currentPreviews,
          currentOffset: state.currentOffset,
          count: state.count,
          hasReachedMax: state.hasReachedMax,
        ),
      );

      final response = await _blogRepository.getBlogPreviews(
        offset: state.currentOffset,
      );

      final updatedPreviews = [...currentPreviews, ...response.previews];

      emit(
        BlogOverviewLoaded(
          previews: updatedPreviews,
          currentOffset: state.currentOffset + response.previews.length,
          count: state.count,
          hasReachedMax:
              state.count != null && updatedPreviews.length >= state.count!,
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
}
