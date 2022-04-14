import 'package:bloc/bloc.dart';
import 'package:lawpedia_app/model/model.dart';
import 'package:meta/meta.dart';
import 'package:lawpedia_app/services/service.dart';
part 'artikel_state.dart';

class ArtikelCubit extends Cubit<ArtikelState> {
  ArtikelCubit() : super(ArtikelInitial());

  Future<void> getArtikelBanner() async {
     ApiReturnValue<BannerArtikel> banner =
        await Artikel.getBannerArtikel();
    if (banner.success == "error") {
      emit(ArtikelFailed(banner.message.toString()));
    } else {
      emit(ArtikelSukses(banner.value!));
    }
  }
}
