part of 'layanan_hukum_cubit.dart';

@immutable
abstract class LayananHukumState {}

class LayananHukumInitial extends LayananHukumState {}

class LayananHukumSukses extends LayananHukumState {
  LayananHukumSubKategori layananHukumSubKategori;
  LayananHukumSukses(this.layananHukumSubKategori);
  @override
  List<Object> get props => [layananHukumSubKategori];
}

class LayananHukumFailed extends LayananHukumState {
  final String message;

  LayananHukumFailed(this.message);
  @override
  List<Object> get props => [message];
}
