import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:lawpedia_app/services/service.dart';
part 'bertanya_state.dart';

class BertanyaCubit extends Cubit<BertanyaState> {
  BertanyaCubit() : super(BertanyaInitial());

  Future<void> bertanya(String title, String body, int anonim) async {
    ApiReturnValue result = await QAService.bertanya(title, body, anonim);
    if (result.success == "error") {
      emit(BertanyaGagal(result.message.toString()));
    } else {
      emit(BerhasilBertanya(result.message.toString()));
    }
  }
}
