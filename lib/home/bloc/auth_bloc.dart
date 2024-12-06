import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<SignupSubmitted>(_onSignupSubmitted);
  }

  void _onLoginSubmitted(LoginSubmitted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      // Simulate API call (replace with actual API logic)
      await Future.delayed(const Duration(milliseconds: 1));

      // Successful login logic (You can handle your API response here)
      emit(AuthSuccess());
    } catch (e) {
      emit(const AuthFailure(error: 'Login Failed. Please try again.'));
    }
  }

  void _onSignupSubmitted(
      SignupSubmitted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      // Simulate API call (replace with actual API logic)
      await Future.delayed(const Duration(milliseconds: 1));

      // Successful signup logic
      emit(AuthSuccess());
    } catch (e) {
      emit(const AuthFailure(error: 'Signup Failed. Please try again.'));
    }
  }
}
