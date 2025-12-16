import 'package:equatable/equatable.dart';
import '../../../core/sate_status/sate_status.dart';
import '../../../domin/entity/get_details_entity.dart';
class GetDetailsMovieState extends Equatable {
  final StateStatus<DetailsMovieEntity> stateStatus;
  const GetDetailsMovieState({this.stateStatus = const StateStatus.initial()});
  GetDetailsMovieState copyWith({StateStatus<DetailsMovieEntity>? stateStatus}) {
    return GetDetailsMovieState(
      stateStatus: stateStatus ?? this.stateStatus,
    );
  }
  @override
  List<Object?> get props => [stateStatus];
}
