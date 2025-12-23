import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constant_app/app_text.dart';
import 'package:movie_app/core/customs/custom_elevated_button.dart';
import 'package:movie_app/core/customs/custom_text_form_field.dart';
import '../../../core/app_routs/routes_name.dart';
import '../../../core/constant_app/colors_app.dart';
import '../../../core/constant_app/icons_app.dart';
import '../../../core/loaders/loaders.dart';
import '../view_model/register_cubit.dart';
import '../view_model/register_intent.dart';
import '../view_model/register_state.dart';
class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          AppText.register.tr(), style: TextStyle(color: ColorsApp.primaryColor),),
        centerTitle: true,
        leading: IconButton(
          color: ColorsApp.primaryColor,
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pushReplacementNamed(context, RoutesName.login),
        ),
      ),
      body: Form(
        key: cubit.formKey,
        child: Column(
          children: [
            RSizedBox(height: 50),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: CustomTextFormField(
                controller: cubit.nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppText.pleaseEnterYourName.tr();
                  }
                  if (value.length < 3) {
                    return AppText.nameMustBeEtLeastThreeCharacters.tr();
                  }
                  return null;
                },
                hintText: AppText.name.tr(),
                hintStyle: TextStyle(color: ColorsApp.primaryColor),
                style: TextStyle(color: ColorsApp.primaryColor),
                prefixIcon: ImageIcon(
                    AssetImage(IconsApp.id)),
                borderRadius: 15,
                label: AppText.name,
                labelStyle: TextStyle(color: ColorsApp.primaryColor),
              ),
            ),
            RSizedBox(height: 20),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: CustomTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppText.pleaseEnterYourEmail.tr();
                  }
                  if (!value.contains('@')) {
                    return AppText.pleaseEnterValidEmail.tr();
                  }
                  return null;
                },
                controller: cubit.emailController,
                labelStyle: TextStyle(color: ColorsApp.primaryColor),
                style: TextStyle(color: ColorsApp.primaryColor),
                borderRadius: 15,
                hintText: AppText.email.tr(),
                prefixIcon: const Icon(Icons.email),
                label: AppText.email.tr(),
              ),
            ),
            RSizedBox(height: 20),
            BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                final cubit = context.read<RegisterCubit>();
                return Padding(
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  child: CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty) return AppText.pleaseEnterYourPassword.tr();
                      if (value.length < 6) return AppText.passwordMustBeAtLeastSixCharacters.tr();
                      return null;
                    },
                    controller: cubit.passwordController,
                    labelStyle: TextStyle(color: ColorsApp.primaryColor),
                    style: TextStyle(color: ColorsApp.primaryColor),
                    label: AppText.password.tr(),
                    prefixIcon: const Icon(Icons.lock),
                    borderRadius: 15,
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
                  ),
                );
              },
            ),
            RSizedBox(height: 20),
            BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                final cubit = context.read<RegisterCubit>();
                return Padding(
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  child: CustomTextFormField(
                    controller: cubit.confirmPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) return AppText.pleaseEnterYourPassword.tr();
                      if (value != cubit.passwordController.text) {
                        return AppText.passwordsDoNotMatch.tr();
                      }
                      return null;
                    },
                    labelStyle: TextStyle(color: ColorsApp.primaryColor),
                    style: TextStyle(color: ColorsApp.primaryColor),
                    label: AppText.confirmPassword.tr(),
                    prefixIcon: const Icon(Icons.lock),
                    obscureText: cubit.isConfirmPasswordHidden,
                    borderRadius: 15,
                    suffixIcon: IconButton(
                      onPressed: () {
                        cubit.confirmPasswordVisibility();
                      },
                      icon: Icon(
                        cubit.isConfirmPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: ColorsApp.primaryColor,
                      ),
                    ),
                  ),
                );
              },
            ),
            RSizedBox(height: 20,),
            BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state.registerStatus.isSuccess) {
                  Navigator.pushReplacementNamed(context, RoutesName.login);
                Loaders.showSuccessMessage(
                  message: AppText.registerSuccess.tr(),
                  context: context,
                );
                }
                if (state.registerStatus.isFailure) {
                  Loaders.showErrorMessage(
                    message: state.registerStatus.error?.message ?? "",
                    context: context,
                  );
                  cubit.resetRegisterState();
                }
              },
              builder: (context, state) {
                if (state.registerStatus.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Padding(
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  child: CustomElevatedButton(
                    backgroundColor: state.isButtonDisabled
                        ? ColorsApp.primaryColor
                        : ColorsApp.greyColor,
                    onPressed: state.isButtonDisabled
                        ? () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.doIntent(
                          CallRegisterIntent(
                            cubit.emailController.text,
                            cubit.passwordController.text,
                          ),
                        );
                      }
                    }
                        : null,
                    buttonTitle: AppText.createAccount.tr(),
                    isStart: false,
                  ),
                );
              },
            ),
            RSizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppText.alreadyHaveAnAccount.tr(),
                  style: TextStyle(color: ColorsApp.whiteColor),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, RoutesName.login);
                  },
                  child: Text(
                    AppText.login.tr(),
                    style: TextStyle(color: ColorsApp.primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
