part of 'artikel_cubit.dart';

@immutable
abstract class ArtikelState {}

class ArtikelInitial extends ArtikelState {}

class ArtikelSukses extends ArtikelState {
  BannerArtikel bannerArtikel;
  ArtikelSukses(this.bannerArtikel);
  @override
  List<Object> get props => [bannerArtikel];
}
class DetailArtikelSukses extends ArtikelState {
  ArtikelDetail artikelDetail;
  DetailArtikelSukses(this.artikelDetail);
  @override
  List<Object> get props => [artikelDetail];
}
class ArtikelFailed extends ArtikelState {
  final String message;

  ArtikelFailed(this.message);
  @override
  String toString() {
    return 'KonsultanHukumFailedState{errorMessage: $message}';
  }
}
class DetailArtikelFailed extends ArtikelState {
  final String message;

  DetailArtikelFailed(this.message);
  @override
  String toString() {
    return 'KonsultanHukumFailedState{errorMessage: $message}';
  }
}
