part of 'konstultanhukumdetail_cubit.dart';

@immutable
abstract class KonstultanhukumdetailState {
    const KonstultanhukumdetailState();

  @override
  List<Object> get props => [];
}

class KonstultanhukumdetailInitial extends KonstultanhukumdetailState {}
class KonsultanHukumDetailSukses extends KonstultanhukumdetailState {
  KonsultanHukumDetail detailkonsultan;
  KonsultanHukumDetailSukses(this.detailkonsultan);
  @override
  List<Object> get props => [detailkonsultan];
}
class KonsultanHukumDetailFailed extends KonstultanhukumdetailState {
  final String message;

  const KonsultanHukumDetailFailed(this.message);
  @override
  String toString() {
    return 'KonsultanHukumFailedState{errorMessage: $message}';
  }
}

