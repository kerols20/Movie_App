import '../../../domin/entity/get_details_entity.dart';
import '../../client/api_result.dart';
abstract class GetMovieDetailsDataSource{
  Future<Result<DetailsMovieEntity>> getMoviesDetails({required int movieId});
}