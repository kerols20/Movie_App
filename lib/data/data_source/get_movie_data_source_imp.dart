import 'package:injectable/injectable.dart';
import 'package:movie_app/domin/entity/list_movie_entity.dart';
import '../../api/client/api_client.dart';
import '../../api/client/api_result.dart';
import '../../api/data_source/get_movie_data_source.dart';
@Injectable(as: GetMovieDataSource)
class GetMovieDataSourceImp implements GetMovieDataSource {
  final ApiClient _apiClient;
  GetMovieDataSourceImp(this._apiClient);
  @override
  Future<Result<ListMovieEntity>> getMovies() async {
    return await executeApi(()async {
      final response = await _apiClient.getMovies();
      return response.toEntity();
    },);
  }
}
