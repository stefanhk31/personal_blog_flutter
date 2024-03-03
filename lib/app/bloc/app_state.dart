part of 'app_bloc.dart';

sealed class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

final class AppInitial extends AppState {}

final class AppFailure extends AppState {
  const AppFailure({required this.error});

  final Object error;

  @override
  List<Object> get props => [error];
}
