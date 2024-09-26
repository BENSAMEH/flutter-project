part of 'home_screen_cubit.dart';

@immutable
sealed class HomeScreenState {
  const HomeScreenState();
}

final class HomeScreenInitial extends HomeScreenState {}
final class HomeScreenLoading extends HomeScreenState {}
final class HomeScreeDone extends HomeScreenState {}
final class HomeScreenError extends HomeScreenState {}

