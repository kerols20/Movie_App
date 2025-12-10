import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/dip/dip.dart';
import '../view_model/get_movie_cubit.dart';
import '../view_model/get_movie_intent.dart';
import 'get_movie_view_body.dart';

class GetMovieView extends StatelessWidget {
  const GetMovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetMovieCubit>()..doIntent(InitializationGetMovieIntent()),
      child: const GetMovieViewBody(),
    );
  }
}
