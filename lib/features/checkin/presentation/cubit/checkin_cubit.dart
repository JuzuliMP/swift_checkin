import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'checkin_state.dart';

class CheckinCubit extends Cubit<CheckinState> {
  CheckinCubit() : super(CheckinInitial());

  Future<void> performCheckin({
    required String project,
    required String gate,
    required String workType,
  }) async {
    emit(CheckinLoading());

    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));

    // Simple validation
    if (project.isEmpty || gate.isEmpty || workType.isEmpty) {
      emit(const CheckinError('Please fill in all fields'));
      return;
    }

    emit(CheckinSuccess());
  }
}