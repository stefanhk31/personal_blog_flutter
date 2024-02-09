import 'dart:async';

import 'package:api_client/api_client.dart';
import 'package:bloc/bloc.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:equatable/equatable.dart';

part 'blog_detail_event.dart';
part 'blog_detail_state.dart';

class BlogDetailBloc extends Bloc<BlogDetailEvent, BlogDetailState> {
  BlogDetailBloc({required BlogRepository blogRepository})
      : _blogRepository = blogRepository,
        super(BlogDetailInitial()) {
    on<BlogDetailRequested>(_onBlogDetailRequested);
  }

  final BlogRepository _blogRepository;

  FutureOr<void> _onBlogDetailRequested(
    BlogDetailRequested event,
    Emitter<BlogDetailState> emit,
  ) async {
    emit(BlogDetailLoading());
    try {
      final detail = await _blogRepository.getBlogDetail(slug: event.slug);
      emit(BlogDetailLoaded(detail: detail));
    } on Exception catch (e) {
      if (e is ApiRequestFailure) {
        emit(BlogDetailFailure(message: e.body));
        return;
      }
      emit(BlogDetailFailure(message: e.toString()));
    }
  }
}