import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login(String phoneNumber, String passcode) async {
    emit(AuthLoading());

    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));

    // Simple validation
    if (phoneNumber.isEmpty || passcode.isEmpty) {
      emit(const AuthError('Please fill in all fields'));
      return;
    }

    if (passcode.length != 4) {
      emit(const AuthError('Passcode must be 4 digits'));
      return;
    }

    emit(AuthSuccess());
  }
}
