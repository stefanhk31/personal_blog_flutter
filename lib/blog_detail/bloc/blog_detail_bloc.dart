import 'dart:async';

import 'package:api_client/api_client.dart';
import 'package:bloc/bloc.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:personal_blog_flutter/utils/url_launcher.dart';

part 'blog_detail_event.dart';
part 'blog_detail_state.dart';

class BlogDetailBloc extends Bloc<BlogDetailEvent, BlogDetailState> {
  BlogDetailBloc({
    required BlogRepository blogRepository,
    required String slug,
    UrlLauncher? urlLauncher,
  })  : _blogRepository = blogRepository,
        _slug = slug,
        _urlLauncher = urlLauncher ?? UrlLauncher(),
        super(BlogDetailInitial()) {
    on<BlogDetailRequested>(_onBlogDetailRequested);
    on<BlogLinkClicked>(_onBlogLinkClicked);
  }

  final BlogRepository _blogRepository;
  final String _slug;
  final UrlLauncher _urlLauncher;

  FutureOr<void> _onBlogDetailRequested(
    BlogDetailRequested event,
    Emitter<BlogDetailState> emit,
  ) async {
    emit(BlogDetailLoading());
    try {
      final detail = await _blogRepository.getBlogDetail(slug: _slug);
      emit(BlogDetailLoaded(detail: detail));
    } on Exception catch (e) {
      if (e is ApiRequestFailure) {
        emit(BlogDetailFailure(message: e.body));
        return;
      }
      emit(BlogDetailFailure(message: e.toString()));
    }
  }

  FutureOr<void> _onBlogLinkClicked(
    BlogLinkClicked event,
    Emitter<BlogDetailState> emit,
  ) async {
    try {
      if (await _urlLauncher.validateUrl(url: event.url)) {
        await _urlLauncher.launchUrl(url: event.url);
      }
    } on Exception catch (e) {
      emit(BlogDetailFailure(message: e.toString()));
    }
  }
}
