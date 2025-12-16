import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domin/entity/list_movie_entity.dart';
import '../../../api/client/api_result.dart';
import '../../../core/sate_status/sate_status.dart';
import '../../../domin/use_case/get_movie_use_case/get_movie_use_case.dart';
import 'get_movie_intent.dart';
import 'get_movie_state.dart';
@injectable
class GetMovieCubit extends Cubit<GetMovieState> {
  final GetMovieUseCase _useCase;
  GetMovieCubit(this._useCase) : super(GetMovieState());
Future<void> doIntent(GetMovieIntent intent)async{
  switch(intent){
    case InitializationGetMovieIntent():
      await _onInit();
  }
}
  Future<void> _onInit()async{
    await getListOfMovie();
    if(isClosed) return;
  }
  void changeImageIndex(int index) {
    emit(state.copyWith(currentImageIndex: index));
  }

Future<void> getListOfMovie()async{
  emit(state.copyWith(stateStatus: StateStatus.loading()));
  final result = await _useCase.getMovies();
  if(isClosed) return;
  switch(result){
    case Success():
      emit(state.copyWith(stateStatus: StateStatus.success(result.data)));
    case Failure<ListMovieEntity>():
      emit(state.copyWith(stateStatus: StateStatus.failure(result.responseException)));
  }
}
}
