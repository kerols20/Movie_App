import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/global_cubit/global_cubit.dart';
import '../../sign_up/view_model/login_with_google_cubit.dart';
import '../view_model/login_cubit.dart';
import 'login_view_body.dart';
class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginWithGoogle(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => GlobalCubit(),
        ),
      ],
      child: const LoginViewBody(),
    );
  }
}
