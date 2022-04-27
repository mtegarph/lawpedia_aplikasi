import 'package:bloc/bloc.dart';
import 'package:lawpedia_app/model/model.dart';
import 'package:meta/meta.dart';
import 'package:lawpedia_app/services/service.dart';
part 'artikel_state.dart';

class ArtikelCubit extends Cubit<ArtikelState> {
  ArtikelCubit() : super(ArtikelInitial());

  

  Future<void> getDetailArtikel(int id) async {
    ApiReturnValue<ArtikelDetail> banner = await Artikel.getDetailArtikel(id);
    if (banner.value == null) {
      emit(DetailArtikelFailed(banner.message.toString()));
    } else {
      emit(DetailArtikelSukses(banner.value!));
    }
  }
}
