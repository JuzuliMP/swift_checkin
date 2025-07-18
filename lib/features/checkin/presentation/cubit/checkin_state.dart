part of 'checkin_cubit.dart';

abstract class CheckinState extends Equatable {
  const CheckinState();

  @override
  List<Object> get props => [];
}

class CheckinInitial extends CheckinState {}

class CheckinLoading extends CheckinState {}

class CheckinSuccess extends CheckinState {}

class CheckinError extends CheckinState {
  final String message;

  const CheckinError(this.message);

  @override
  List<Object> get props => [message];
}
