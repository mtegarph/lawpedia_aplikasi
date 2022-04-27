part of 'artikel_cubit.dart';

@immutable
abstract class ArtikelState {
  const ArtikelState();

  @override
  List<Object> get props => [];
}

class ArtikelInitial extends ArtikelState {}



// ignore: must_be_immutable
class DetailArtikelSukses extends ArtikelState {
  ArtikelDetail artikelDetail;
  DetailArtikelSukses(this.artikelDetail);
  @override
  List<Object> get props => [artikelDetail];
}



class DetailArtikelFailed extends ArtikelState {
  final String message;

  DetailArtikelFailed(this.message);
  @override
  List<Object> get props => [message];
}
