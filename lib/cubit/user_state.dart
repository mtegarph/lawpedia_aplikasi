part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class userFailed extends UserState {
  final String message;

  userFailed(this.message);
  @override
  String toString() {
    return 'gagalLoginState{errorMessage: $message}';
  }
}

class userSuccess extends UserState {
  final UserDetail userDetail;

  userSuccess(this.userDetail);
  @override
  List<Object> get props => [userDetail];
}
