import 'package:injectable/injectable.dart';
import '../../../api/client/api_result.dart';
import '../../entity/list_movie_entity.dart';
import '../../repositories/get_movie_repositories/get_movie_repositories.dart';
@injectable
class GetMovieUseCase{
  final GetMovieRepositories _repositories;
  GetMovieUseCase(this._repositories);
  Future<Result<ListMovieEntity>> getMovies()async{
    return await _repositories.getMovies();
  }
}
/// to be continue in cubit and UI