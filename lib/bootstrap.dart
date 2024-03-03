import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:blog_api_client/blog_api_client.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:personal_blog_flutter/app/app.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  // Add cross-flavor configuration here

  runApp(await builder());
}

FutureOr<Widget> buildApp(String baseUrl) async {
  if (baseUrl.isEmpty) {
    throw ArgumentError('baseUrl must not be empty.');
  }

  final blogApi = BlogApi(baseUrl: baseUrl, client: Client());
  final blogRepository = BlogRepository(blogApi: blogApi);

  return App(blogRepository: blogRepository);
}
