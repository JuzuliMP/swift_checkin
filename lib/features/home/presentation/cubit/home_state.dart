part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeTimerUpdate extends HomeState {
  final Duration workingTime;

  const HomeTimerUpdate(this.workingTime);

  @override
  List<Object> get props => [workingTime];
}