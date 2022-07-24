import 'package:bloc/bloc.dart';
import 'package:lawpedia_app/model/model.dart';
import 'package:lawpedia_app/services/service.dart';
import 'package:meta/meta.dart';

part 'layanan_hukum_state.dart';

class LayananHukumCubit extends Cubit<LayananHukumState> {
  LayananHukumCubit() : super(LayananHukumInitial());
  Future<void> getlayananHukumSub(int id) async {
    ApiReturnValue<LayananHukumSubKategori> banner =
        await KonsultanHukumServices.getListLayananHukumSub(id);
    if (banner.value == null) {
      emit(LayananHukumFailed(banner.message.toString()));
    } else {
      emit(LayananHukumSukses(banner.value!));
    }
  }
}
