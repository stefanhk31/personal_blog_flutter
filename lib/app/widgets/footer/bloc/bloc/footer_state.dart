part of 'footer_bloc.dart';

sealed class FooterState extends Equatable {
  const FooterState();

  @override
  List<Object> get props => [];
}

final class FooterInitial extends FooterState {}

final class FooterFailure extends FooterState {
  const FooterFailure({required this.error});

  final Object error;

  @override
  List<Object> get props => [error];
}
