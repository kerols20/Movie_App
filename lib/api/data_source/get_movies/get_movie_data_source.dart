import '../../../domin/entity/list_movie_entity.dart';
import '../../client/api_result.dart';
abstract class GetMovieDataSource{
  Future<Result<ListMovieEntity>> getMovies();
}