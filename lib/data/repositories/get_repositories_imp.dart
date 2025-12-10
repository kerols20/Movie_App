import 'package:injectable/injectable.dart';
import 'package:movie_app/api/client/api_result.dart';
import 'package:movie_app/domin/entity/list_movie_entity.dart';
import '../../api/data_source/get_movie_data_source.dart';
import '../../domin/repositories/get_movie_repositories.dart';
@Injectable(as: GetMovieRepositories)
class GetRepositories implements GetMovieRepositories{
  final GetMovieDataSource _source;
  GetRepositories(this._source);
  @override
  Future<Result<ListMovieEntity>> getMovies()async {
    return await _source.getMovies();
  }
}