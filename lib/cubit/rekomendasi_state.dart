part of 'rekomendasi_cubit.dart';

@immutable
abstract class RekomendasiState {}

class RekomendasiInitial extends RekomendasiState {}

class RekomendasiSukses extends RekomendasiState {
  RekomendasiKonsultan detailkonsultan;
  RekomendasiSukses(this.detailkonsultan);
  @override
  List<Object> get props => [detailkonsultan];
}

class RekomendasiiFailed extends RekomendasiState {
  final String message;

  RekomendasiiFailed(this.message);
  @override
  String toString() {
    return 'KonsultanHukumFailedState{errorMessage: $message}';
  }
}
