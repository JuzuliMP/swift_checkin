import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:async';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Timer? _timer;
  Duration _workingTime = Duration.zero;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _workingTime = _workingTime + const Duration(seconds: 1);
      emit(HomeTimerUpdate(_workingTime));
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Future<void> close() {
    stopTimer();
    return super.close();
  }
}