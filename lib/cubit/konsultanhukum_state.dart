part of 'konsultanhukum_cubit.dart';

@immutable
abstract class KonsultanhukumState {}

class KonsultanhukumInitial extends KonsultanhukumState {}

// ignore: must_be_immutable
class KonsultanHukumSukses extends KonsultanhukumState {
  BannerKonsultan bannerKonsultan;
  KonsultanHukumSukses(this.bannerKonsultan);
  @override
  List<Object> get props => [bannerKonsultan];
}

class KonsultanHukumFailed extends KonsultanhukumState {
  final String message;

  KonsultanHukumFailed(this.message);
  @override
  String toString() {
    return 'KonsultanHukumFailedState{errorMessage: $message}';
  }
}
