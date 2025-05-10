part of 'home_cubit.dart';

abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeLoading extends HomeStates {}

class HomeSuccess extends HomeStates {
  final List<Movie> data;
  HomeSuccess({required this.data});
}

class HomeError extends HomeStates {
  final String msg;
  HomeError({required this.msg});
}
