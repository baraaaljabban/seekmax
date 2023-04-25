part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {}

class AppIsLoggedInState extends AppState {
  final bool isLoggedIn;
  const AppIsLoggedInState({required this.isLoggedIn});
}
