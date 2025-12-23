// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../api/client/api_client.dart' as _i508;
import '../../api/client/api_module.dart' as _i272;
import '../../api/data_source/get_movie_details/get_movies_details.dart'
    as _i920;
import '../../api/data_source/get_movies/get_movie_data_source.dart' as _i875;
import '../../data/data_source/get_details_movie/get_details_movie_data_source_imp.dart'
    as _i788;
import '../../data/data_source/get_movies/get_movie_data_source_imp.dart'
    as _i38;
import '../../data/repositories/get_details_movie_repositories/get_details_repositories_imp.dart'
    as _i416;
import '../../data/repositories/get_movie_repositories/get_repositories_imp.dart'
    as _i166;
import '../../domin/repositories/get_details_repositories/get_details_repositories.dart'
    as _i813;
import '../../domin/repositories/get_movie_repositories/get_movie_repositories.dart'
    as _i317;
import '../../domin/use_case/get_details_movie/get_details_movie_use_case.dart'
    as _i113;
import '../../domin/use_case/get_movie_use_case/get_movie_use_case.dart'
    as _i471;
import '../../presentation/get_details_movie/view_model/get_details_movie_cubit.dart'
    as _i470;
import '../../presentation/get_movie/view_model/get_movie_cubit.dart' as _i832;
import '../global_cubit/global_cubit.dart' as _i209;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final apiModule = _$ApiModule();
    gh.factory<_i209.GlobalCubit>(() => _i209.GlobalCubit());
    gh.singleton<_i361.Dio>(() => apiModule.provideDio());
    gh.factory<_i508.ApiClient>(() => _i508.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i875.GetMovieDataSource>(
        () => _i38.GetMovieDataSourceImp(gh<_i508.ApiClient>()));
    gh.factory<_i920.GetMovieDetailsDataSource>(
        () => _i788.GetDetailsMovieDataSourceImp(gh<_i508.ApiClient>()));
    gh.factory<_i813.GetDetailsMovieRepositories>(() =>
        _i416.GetDetailsMovieRepositoriesImp(
            gh<_i920.GetMovieDetailsDataSource>()));
    gh.factory<_i317.GetMovieRepositories>(
        () => _i166.GetRepositories(gh<_i875.GetMovieDataSource>()));
    gh.factory<_i113.GetDetailsMovieUseCase>(() =>
        _i113.GetDetailsMovieUseCase(gh<_i813.GetDetailsMovieRepositories>()));
    gh.factory<_i470.GetDetailsMovieCubit>(
        () => _i470.GetDetailsMovieCubit(gh<_i113.GetDetailsMovieUseCase>()));
    gh.factory<_i471.GetMovieUseCase>(
        () => _i471.GetMovieUseCase(gh<_i317.GetMovieRepositories>()));
    gh.factory<_i832.GetMovieCubit>(
        () => _i832.GetMovieCubit(gh<_i471.GetMovieUseCase>()));
    return this;
  }
}

class _$ApiModule extends _i272.ApiModule {}
