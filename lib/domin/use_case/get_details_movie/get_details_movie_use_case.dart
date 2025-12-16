import 'package:injectable/injectable.dart';

import '../../../api/client/api_result.dart';
import '../../entity/get_details_entity.dart';
import '../../repositories/get_details_repositories/get_details_repositories.dart';
@injectable
class GetDetailsMovieUseCase{
  final GetDetailsMovieRepositories _repositories;
  GetDetailsMovieUseCase(this._repositories);
  Future<Result<DetailsMovieEntity>> getMovies({required int movieId})async{
    return await _repositories.getMovies(movieId: movieId);
  }
}