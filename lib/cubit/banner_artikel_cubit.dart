import 'package:bloc/bloc.dart';
import 'package:lawpedia_app/model/model.dart';
import 'package:lawpedia_app/services/service.dart';
import 'package:meta/meta.dart';

part 'banner_artikel_state.dart';

class BannerArtikelCubit extends Cubit<BannerArtikelState> {
  BannerArtikelCubit() : super(BannerArtikelInitial());

  Future<void> getArtikelBanner() async {
    ApiReturnValue<BannerArtikel> banner = await Artikel.getBannerArtikel();
    if (banner.value == null) {
      emit(ArtikelFailed(banner.message.toString()));
    } else {
      emit(ArtikelSukses(banner.value!));
    }
  }
}
