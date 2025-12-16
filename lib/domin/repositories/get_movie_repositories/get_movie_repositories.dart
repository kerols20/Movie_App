import '../../../api/client/api_result.dart';
import '../../entity/list_movie_entity.dart';

abstract class GetMovieRepositories{
  Future<Result<ListMovieEntity>> getMovies();
}