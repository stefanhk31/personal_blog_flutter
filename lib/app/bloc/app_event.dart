part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  // coverage:ignore-start
  @override
  List<Object> get props => [];
  // coverage:ignore-end
}

class FooterLinkClicked extends AppEvent {
  const FooterLinkClicked({
    required this.url,
  });

  final String url;

  @override
  List<Object> get props => [url];
}
