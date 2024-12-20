import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginSubmitted extends AuthEvent {
  final String email;
  final String password;

  const LoginSubmitted({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SignupSubmitted extends AuthEvent {
  final String email;
  final String password;
  final String name;

  const SignupSubmitted(
      {required this.email, required this.password, required this.name});

  @override
  List<Object> get props => [email, password];
}
