import 'package:injectable/injectable.dart';
import 'package:movie_app/api/client/api_result.dart';
import '../../../api/data_source/get_movie_details/get_movies_details.dart';
import '../../../domin/entity/get_details_entity.dart';
import '../../../domin/repositories/get_details_repositories/get_details_repositories.dart';
@Injectable(as: GetDetailsMovieRepositories)
class GetDetailsMovieRepositoriesImp implements GetDetailsMovieRepositories{
  final GetMovieDetailsDataSource _getMovieDetails;
  GetDetailsMovieRepositoriesImp(this._getMovieDetails);
  @override
  Future<Result<DetailsMovieEntity>> getMovies({required int movieId}) {
    return _getMovieDetails.getMoviesDetails(
      movieId: movieId,
    );
  }
}