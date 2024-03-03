import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:personal_blog_flutter/utils/url_launcher.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({UrlLauncher? urlLauncher})
      : _urlLauncher = urlLauncher ?? UrlLauncher(),
        super(AppInitial()) {
    on<FooterLinkClicked>(_onFooterLinkClicked);
  }

  final UrlLauncher _urlLauncher;

  FutureOr<void> _onFooterLinkClicked(
    FooterLinkClicked event,
    Emitter<AppState> emit,
  ) async {
    try {
      if (await _urlLauncher.validateUrl(url: event.url)) {
        await _urlLauncher.launchUrl(url: event.url);
      }
    } on Exception catch (e) {
      emit(AppFailure(error: e.toString()));
    }
  }
}
