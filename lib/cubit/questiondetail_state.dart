part of 'questiondetail_cubit.dart';

@immutable
abstract class QuestiondetailState {}

class QuestiondetailInitial extends QuestiondetailState {}

class QuestionDetailFailed extends QuestiondetailState {
  final String message;

  QuestionDetailFailed(this.message);
  @override
  String toString() {
    return 'gagalQuestionDetailState{errorMessage: $message}';
  }
}

class QuestionDetailSuccess extends QuestiondetailState {
  final QuestionDetail questionDetail;

  QuestionDetailSuccess(this.questionDetail);

  @override
  List<Object> get props => [questionDetail];
}
