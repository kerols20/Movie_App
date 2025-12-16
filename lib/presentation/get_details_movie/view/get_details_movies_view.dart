import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/dip/dip.dart';
import '../view_model/get_details_movie_cubit.dart';
import '../view_model/get_details_movie_intent.dart';
import 'get_details_movies_view_body.dart';
class GetDetailsMoviesView extends StatelessWidget {
  final int movieId;
  const GetDetailsMoviesView({super.key, required this.movieId});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetDetailsMovieCubit>()..doIntent(InitializationGetDetailsMovieIntent(
        movieId: movieId,
      )),
      child: GetDetailsMoviesViewBody(),
    );
  }
}
