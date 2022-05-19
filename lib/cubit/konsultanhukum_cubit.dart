import 'package:bloc/bloc.dart';
import 'package:lawpedia_app/model/model.dart';
import 'package:lawpedia_app/services/service.dart';

import 'package:meta/meta.dart';

part 'konsultanhukum_state.dart';

class KonsultanhukumCubit extends Cubit<KonsultanhukumState> {
  KonsultanhukumCubit() : super(KonsultanhukumInitial());
  Future<void> getBannerKonsultan() async {
    ApiReturnValue<BannerKonsultan> banner =
        await KonsultanHukumServices.getBannerKonsultan();
    if (banner.success == "error") {
      emit(KonsultanHukumFailed(banner.message.toString()));
    } else {
      emit(KonsultanHukumSukses(banner.value!));
    }
  }
  
}
