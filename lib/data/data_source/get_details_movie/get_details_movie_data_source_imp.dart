import 'package:injectable/injectable.dart';
import 'package:movie_app/api/client/api_result.dart';
import 'package:movie_app/domin/entity/get_details_entity.dart';
import '../../../api/client/api_client.dart';
import '../../../api/data_source/get_movie_details/get_movies_details.dart';
@Injectable(as: GetMovieDetailsDataSource)
class GetDetailsMovieDataSourceImp implements GetMovieDetailsDataSource{
  final ApiClient _apiClient;
  GetDetailsMovieDataSourceImp(this._apiClient);
  @override
  Future<Result<DetailsMovieEntity>> getMoviesDetails({required int movieId})async {
    return await executeApi(()async {
      final response = await _apiClient.getDetailMovies(movieId: movieId);
      return response.toEntity();
    },);
  }
}