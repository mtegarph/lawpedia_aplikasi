import 'package:bloc/bloc.dart';
import 'package:lawpedia_app/model/model.dart';
import 'package:lawpedia_app/services/service.dart';

import 'package:meta/meta.dart';

part 'konstultanhukumdetail_state.dart';

class KonstultanhukumdetailCubit extends Cubit<KonstultanhukumdetailState> {
  KonstultanhukumdetailCubit() : super(KonstultanhukumdetailInitial());
  Future<void> getDetailKonsultan(int id) async {
    ApiReturnValue<KonsultanHukumDetail> detail =
        await KonsultanHukumServices.getKonsultanDetail(id);
    if (detail.success == "error") {
      emit(KonsultanHukumDetailFailed(detail.message.toString()));
    } else {
      emit(KonsultanHukumDetailSukses(detail.value!));
    }
  }

 
}
