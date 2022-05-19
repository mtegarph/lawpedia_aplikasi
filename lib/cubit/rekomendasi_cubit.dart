import 'package:bloc/bloc.dart';
import 'package:lawpedia_app/model/model.dart';
import 'package:lawpedia_app/services/service.dart';
import 'package:meta/meta.dart';

part 'rekomendasi_state.dart';

class RekomendasiCubit extends Cubit<RekomendasiState> {
  RekomendasiCubit() : super(RekomendasiInitial());

  Future<void> getRekomendasiKonsultan() async {
    ApiReturnValue<RekomendasiKonsultan> detail =
        await KonsultanHukumServices.getKonsultanRekomendasi();
    if (detail.success == "error") {
      emit(RekomendasiiFailed(detail.message.toString()));
    } else {
      emit(RekomendasiSukses(detail.value!));
    }
  }
}
