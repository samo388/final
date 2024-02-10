abstract class AppState {}

class AppInitial extends AppState {}

class AppLoading extends AppState {}

class AppError extends AppState {
  final String error;

  AppError({required this.error});
}

class AppLoaded extends AppState {}
