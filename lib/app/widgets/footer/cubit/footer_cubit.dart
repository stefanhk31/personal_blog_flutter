import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:personal_blog_flutter/utils/url_launcher.dart';

part 'footer_state.dart';

class FooterCubit extends Cubit<FooterState> {
  FooterCubit({UrlLauncher? urlLauncher})
      : _urlLauncher = urlLauncher ?? UrlLauncher(),
        super(FooterInitial());

  final UrlLauncher _urlLauncher;

  Future<void> launchFooterLink(String url) async {
    try {
      if (await _urlLauncher.validateUrl(url: url)) {
        await _urlLauncher.launchUrl(url: url);
      }
    } on Exception catch (e) {
      emit(FooterFailure(error: e.toString()));
    }
  }
}
