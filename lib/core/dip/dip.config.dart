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
import '../../api/data_source/get_movie_data_source.dart' as _i825;
import '../../data/data_source/get_movie_data_source_imp.dart' as _i1035;
import '../../data/repositories/get_repositories_imp.dart' as _i739;
import '../../domin/repositories/get_movie_repositories.dart' as _i129;
import '../../domin/use_case/get_movie_use_case.dart' as _i1043;
import '../../presentation/get_movie/view_model/get_movie_cubit.dart' as _i832;
import '../global_cubit/global_cubit.dart' as _i209;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final apiModule = _$ApiModule();
    gh.factory<_i209.GlobalCubit>(() => _i209.GlobalCubit());
    gh.singleton<_i361.Dio>(() => apiModule.provideDio());
    gh.factory<_i508.ApiClient>(() => _i508.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i825.GetMovieDataSource>(
      () => _i1035.GetMovieDataSourceImp(gh<_i508.ApiClient>()),
    );
    gh.factory<_i129.GetMovieRepositories>(
      () => _i739.GetRepositories(gh<_i825.GetMovieDataSource>()),
    );
    gh.factory<_i1043.GetMovieUseCase>(
      () => _i1043.GetMovieUseCase(gh<_i129.GetMovieRepositories>()),
    );
    gh.factory<_i832.GetMovieCubit>(
      () => _i832.GetMovieCubit(gh<_i1043.GetMovieUseCase>()),
    );
    return this;
  }
}

class _$ApiModule extends _i272.ApiModule {}
