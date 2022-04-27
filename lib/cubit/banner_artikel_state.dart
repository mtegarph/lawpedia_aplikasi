part of 'banner_artikel_cubit.dart';

@immutable
abstract class BannerArtikelState {
  const BannerArtikelState();

  @override
  List<Object> get props => [];
}

class BannerArtikelInitial extends BannerArtikelState {}

class ArtikelSukses extends BannerArtikelState {
  BannerArtikel bannerArtikel;
  ArtikelSukses(this.bannerArtikel);
  @override
  List<Object> get props => [bannerArtikel];
}

class ArtikelFailed extends BannerArtikelState {
  final String message;

  ArtikelFailed(this.message);
  @override
  @override
  List<Object> get props => [message];
}
