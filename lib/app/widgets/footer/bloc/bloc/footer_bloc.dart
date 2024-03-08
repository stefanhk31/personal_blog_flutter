import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:personal_blog_flutter/utils/url_launcher.dart';

part 'footer_event.dart';
part 'footer_state.dart';

class FooterBloc extends Bloc<FooterEvent, FooterState> {
  FooterBloc({UrlLauncher? urlLauncher})
      : _urlLauncher = urlLauncher ?? UrlLauncher(),
        super(FooterInitial()) {
    on<FooterLinkClicked>(_onFooterLinkClicked);
  }

  final UrlLauncher _urlLauncher;

  FutureOr<void> _onFooterLinkClicked(
    FooterLinkClicked event,
    Emitter<FooterState> emit,
  ) async {
    try {
      if (await _urlLauncher.validateUrl(url: event.url)) {
        await _urlLauncher.launchUrl(url: event.url);
      }
    } on Exception catch (e) {
      emit(FooterFailure(error: e.toString()));
    }
  }
}
