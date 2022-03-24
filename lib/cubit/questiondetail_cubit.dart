import 'package:bloc/bloc.dart';
import 'package:lawpedia_app/model/model.dart';
import 'package:lawpedia_app/services/service.dart';
import 'package:meta/meta.dart';

part 'questiondetail_state.dart';

class QuestiondetailCubit extends Cubit<QuestiondetailState> {
  QuestiondetailCubit() : super(QuestiondetailInitial());

  Future<void> getQuestionDetail(String? id) async {
    ApiReturnValue<QuestionDetail> question = await Question.detailBertanya(id!);
    if (question.success == "error") {
      emit(QuestionDetailFailed(question.message.toString()));
    } else {
      emit(QuestionDetailSuccess(question.value!));
    }
  }
}
