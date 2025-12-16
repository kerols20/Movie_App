import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../api/client/api_result.dart';
import '../../../core/sate_status/sate_status.dart';
import '../../../domin/entity/get_details_entity.dart';
import '../../../domin/use_case/get_details_movie/get_details_movie_use_case.dart';
import 'get_details_movie_intent.dart';
import 'get_details_movie_state.dart';
@injectable
class GetDetailsMovieCubit extends Cubit<GetDetailsMovieState> {
  final GetDetailsMovieUseCase _useCase;
  GetDetailsMovieCubit(this._useCase) : super(GetDetailsMovieState());
  Future<void> doIntent(GetDetailsMovieIntent intent)async{
    switch(intent){
      case InitializationGetDetailsMovieIntent():
        await _onInit(movieId: intent.movieId);
    }
  }
  Future<void> _getListOfMovie({required movieId})async{
    emit(state.copyWith(stateStatus: StateStatus.loading()));
    final result = await _useCase.getMovies(movieId: movieId);
    if(isClosed) return;
    switch(result){
      case Success():
        emit(state.copyWith(stateStatus: StateStatus.success(result.data)));
      case Failure<DetailsMovieEntity>():
        emit(state.copyWith(stateStatus: StateStatus.failure(result.responseException)));
    }
  }
  Future<void> _onInit({required movieId})async{
    await _getListOfMovie(movieId:movieId);
    if(isClosed) return;
  }
}
