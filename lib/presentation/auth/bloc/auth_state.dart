abstract class AuthState {}

class AuthInitial extends AuthState {}

class SignInOnAttempt extends AuthState {}

class SignInSuccess extends AuthState {}

class SignInFailed extends AuthState {
  final String message;

  SignInFailed({required this.message});
}

class SignUpOnAttempt extends AuthState {}

class SignUpSuccess extends AuthState {}

class SignUpFailed extends AuthState {
  final String message;

  SignUpFailed({required this.message});
}
