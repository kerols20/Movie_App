import '../../../api/client/api_result.dart';
import '../../entity/get_details_entity.dart';
abstract class GetDetailsMovieRepositories{
  Future<Result<DetailsMovieEntity>> getMovies({required int movieId});
}