import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../viwe_model/on_boarding_cubit.dart';
import 'on_boarding_view_body.dart';
class OnBoardingView extends StatelessWidget {
  const OnBoardingView ({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: OnBoardingViewBody(),
    );
  }
}
