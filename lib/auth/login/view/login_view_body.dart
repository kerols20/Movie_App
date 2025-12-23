import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/auth/login/view_model/login_state.dart';
import 'package:movie_app/core/app_routs/routes_name.dart';
import '../../../core/constant_app/app_text.dart';
import '../../../core/constant_app/colors_app.dart';
import '../../../core/constant_app/icons_app.dart';
import '../../../core/customs/custom_elevated_button.dart';
import '../../../core/customs/custom_text_form_field.dart';
import '../../../core/global_cubit/global_cubit.dart';
import '../../../core/global_cubit/global_intent.dart';
import '../../../core/global_cubit/global_state.dart';
import '../../../core/loaders/loaders.dart';
import '../../../presentation/bottom_navigation_bar/bottom_navigation_bar.dart';
import '../../sign_up/view_model/login_with_google_cubit.dart';
import '../../sign_up/view_model/login_with_google_intent.dart';
import '../../sign_up/view_model/login_with_google_state.dart';
import '../view_model/login_cubit.dart';
import '../view_model/login_intent.dart';
class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    final globalCubit = context.read<GlobalCubit>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.blackColor,
        body: SingleChildScrollView(
          child: Form(
            key: cubit.formKey,
            child: Column(
              children: [
                const RSizedBox(height: 20),
                Center(
                  child: Image.asset(IconsApp.appIcon, width: 180.w),
                ),
                const RSizedBox(height: 69),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  child: CustomTextFormField(
                    style: TextStyle(color: ColorsApp.primaryColor),
                    controller: cubit.emailController,
                    borderRadius: 15,
                    hintText: AppText.email.tr(),
                    prefixIcon: const Icon(Icons.email),
                    label: AppText.email.tr(),
                  ),
                ),
                const RSizedBox(height: 20),
                Padding(
                    padding: REdgeInsets.symmetric(horizontal: 16),
                    child: BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return CustomTextFormField(
                          borderRadius: 15,
                          hintText: AppText.password.tr(),
                          prefixIcon: const Icon(Icons.lock),
                          style: TextStyle(color: ColorsApp.primaryColor),
                          label: AppText.password.tr(),
                          controller: cubit.passwordController,
                          obscureText: cubit.isPasswordHidden,
                          suffixIcon: IconButton(
                            onPressed: () {
                              cubit.passwordVisibility();
                            },
                            icon: Icon(
                              cubit.isPasswordHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: ColorsApp.primaryColor,
                            ),
                          ),
                        );
                      },
                    )
                ),
                const RSizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesName.forgetPassword);
                      },
                      child: Text(
                        AppText.forgotPassword.tr(),
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: ColorsApp.primaryColor,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationThickness: 3,
                          color: ColorsApp.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const RSizedBox(height: 30),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                     if (state.loginState.isSuccess) {
                       Navigator.pushReplacementNamed(context, RoutesName.bottomNavigationBar);
                       Loaders.showSuccessMessage(
                         message: AppText.loginSuccess.tr(),
                         context: context,
                       );
                    }
                    else if (state.loginState.isFailure) {
                      Loaders.showErrorMessage(
                        message: state.loginState.error?.message ?? "",
                        context: context,
                      );
                       cubit.resetLoginState();
                    }
                  },
                  builder: (context, state) {
                    if (state.loginState.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Padding(
                      padding: REdgeInsets.symmetric(horizontal: 16),
                      child: CustomElevatedButton(
                        onPressed: state.isButtonDisabled
                            ? () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.doIntent(
                              LoginFirebase(
                                cubit.emailController.text,
                                cubit.passwordController.text,
                              ),
                            );
                          }
                        }
                            : null,
                        buttonTitle: AppText.login,
                        isStart: false,
                      )
                    );
                  },
                ),
                RSizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppText.dontHaveAnAccount.tr(),
                      style: TextStyle(color: ColorsApp.whiteColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, RoutesName.register);
                      },
                      child: Text(
                        AppText.createOne.tr(),
                        style: TextStyle(color: ColorsApp.primaryColor),
                      ),
                    ),
                  ],
                ),
                const RSizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        indent: 20,
                        endIndent: 30,
                        color: ColorsApp.primaryColor,
                        thickness: 1.0,
                      ),
                    ),
                    Padding(
                      padding:  REdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(AppText.or.tr(),
                          style: TextStyle(color: ColorsApp.primaryColor)),
                    ),
                    Expanded(
                      child: Divider(
                        endIndent: 30,
                        indent: 20,
                        color: ColorsApp.primaryColor,
                        thickness: 1.0,
                      ),
                    ),
                  ],
                ),
                const RSizedBox(height: 30),
                BlocConsumer<LoginWithGoogle, LoginWithGoogleState>(
                  listener: (context, state) {
                    if (state.loginStatus.isSuccess) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNavigationBarScreen()),
                      );
                      Loaders.showSuccessMessage(message: AppText.successLoginWithGoogle.tr(), context: context);
                    }
                    if (state.loginStatus.isFailure) {
                      Loaders.showErrorMessage(
                        message: state.loginStatus.error?.message ?? "",
                        context: context,
                      );
                    }
                  },
                  builder: (context, state) {
                    final cubit = context.read<LoginWithGoogle>();

                    if (state.loginStatus.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return Padding(
                      padding: REdgeInsets.symmetric(horizontal: 16),
                      child: CustomElevatedButton(
                        onPressed: () async {
                          await cubit.doIntent(SignInWithGoogle());
                        },
                        prefixIcon: Image.asset(
                          IconsApp.googleIcon,
                          color: ColorsApp.blackColor,
                          width: 20.w,
                          height: 20.h,
                        ),
                        backgroundColor: ColorsApp.primaryColor,
                        buttonTitle: AppText.loginWithGoogle.tr(),
                        isStart: false,
                      ),
                    );
                  },
                ),
                const RSizedBox(height: 30),
                BlocBuilder<GlobalCubit, GlobalState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Image.asset(
                            IconsApp.language,
                            width: 80.w,
                          ),
                          onTap: () {
                            globalCubit.doIntent(
                              ChangeLanguageIntent(index: 1),
                              context,
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
                const RSizedBox(height: 30),
                InkWell(
                  child: Image.asset(
                    IconsApp.language,
                    width: 80.w,
                  ),
                  onTap: () {
                    globalCubit.doIntent(
                      ChangeLanguageIntent(index: 0),
                      context,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
