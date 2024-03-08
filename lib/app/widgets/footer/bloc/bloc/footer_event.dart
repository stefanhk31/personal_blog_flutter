part of 'footer_bloc.dart';

sealed class FooterEvent extends Equatable {
  const FooterEvent();

  // coverage:ignore-start
  @override
  List<Object> get props => [];
  // coverage:ignore-end
}

class FooterLinkClicked extends FooterEvent {
  const FooterLinkClicked({
    required this.url,
  });

  final String url;

  @override
  List<Object> get props => [url];
}
