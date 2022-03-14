part of 'bertanya_cubit.dart';

@immutable
abstract class BertanyaState {}

class BertanyaInitial extends BertanyaState {}

class BertanyaGagal extends BertanyaState {
  final String message;

  BertanyaGagal(this.message);
  @override
  String toString() {
    return 'gagalLoginState{errorMessage: $message}';
  }
}

class BerhasilBertanya extends BertanyaState {
  final String message;

  BerhasilBertanya(this.message);
  @override
  String toString() {
    return message;
  }
}
