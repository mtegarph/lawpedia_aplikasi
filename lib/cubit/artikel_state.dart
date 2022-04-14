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

class ArtikelFailed extends ArtikelState {
  final String message;

  ArtikelFailed(this.message);
  @override
  String toString() {
    return 'KonsultanHukumFailedState{errorMessage: $message}';
  }
}
