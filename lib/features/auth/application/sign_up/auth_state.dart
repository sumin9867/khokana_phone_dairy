import 'package:local_telephone_dairy/features/profile/domain/user_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final UserModel userModel;

  AuthAuthenticated({required this.userModel});
}

class AuthUnAuthenticated extends AuthState {}

class AuthLoaded extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
