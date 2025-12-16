import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import '../../core/constant_app/end_point.dart';
import '../response/details_movie.dart';
import '../response/list_movie_response.dart';
part 'api_client.g.dart';
@injectable
@RestApi(baseUrl: EndPoint.baseUrl)
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;
  @GET(EndPoint.listMovie)
   Future<ListMovieResponse> getMovies();

  @GET(EndPoint.detailMovie)
  Future<DetailsMovie> getDetailMovies({
    @Query("movie_id") required int movieId,
  });
}