part of 'inf_screen_cubit.dart';

@immutable
sealed class InfScreenState {}

final class InfScreenInitial extends InfScreenState {}
final class InfScreenLoading extends InfScreenState {}
final class InfScreenDone extends InfScreenState {}
final class InfScreenError extends InfScreenState {}
final class ImagesLoading extends InfScreenState {}
final class ImagesDone extends InfScreenState {}
final class ImagesError extends InfScreenState {}
