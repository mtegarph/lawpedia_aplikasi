part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class gagalLoginState extends LoginState {
  final String message;

  gagalLoginState(this.message);
  @override
  String toString() {
    return 'gagalLoginState{errorMessage: $message}';
  }
}

class berhasilLogin extends LoginState {
  final String token;

  berhasilLogin(this.token);
  @override
  String toString() {
    return token;
  }
}
