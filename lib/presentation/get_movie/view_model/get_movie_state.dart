import 'package:equatable/equatable.dart';
import '../../../core/sate_status/sate_status.dart';
import '../../../domin/entity/list_movie_entity.dart';
class GetMovieState extends Equatable {
  final int currentImageIndex;
final StateStatus<ListMovieEntity> stateStatus;
  const GetMovieState({this.stateStatus = const StateStatus.initial(), this.currentImageIndex = 0});
  GetMovieState copyWith({StateStatus<ListMovieEntity>? stateStatus, int? currentImageIndex}) {
    return GetMovieState(
      currentImageIndex: currentImageIndex ?? this.currentImageIndex,
      stateStatus: stateStatus ?? this.stateStatus,
    );
  }
  @override
  List<Object?> get props => [stateStatus, currentImageIndex];
}
