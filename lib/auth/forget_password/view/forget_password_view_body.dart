import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constant_app/icons_app.dart';
import 'package:movie_app/core/customs/custom_elevated_button.dart';
import 'package:movie_app/core/loaders/loaders.dart';
import '../../../core/app_routs/routes_name.dart';
import '../../../core/constant_app/app_text.dart';
import '../../../core/constant_app/colors_app.dart';
import '../../../core/customs/custom_text_form_field.dart';
import '../view_model/forget_password_cubit.dart';
import '../view_model/forget_password_intent.dart';
import '../view_model/forget_password_state.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetPasswordCubit>();
    return Scaffold(
      backgroundColor: ColorsApp.blackColor,
      appBar: AppBar(
        title: Text(
          AppText.resetPassword.tr(),
          style: TextStyle(color: ColorsApp.primaryColor),
        ),
        centerTitle: true,
        leading: IconButton(
          color: ColorsApp.primaryColor,
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, RoutesName.login),
        ),
      ),
      body: Form(
        key: cubit.formKey,
        child: Column(
          children: [
            RSizedBox(height: 50),
            Center(child: Image.asset(IconsApp.appIcon, width: 180.w)),
            RSizedBox(height: 20),
            CustomTextFormField(
              controller: cubit.emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppText.pleaseEnterYourEmail.tr();
                }
                if (!value.contains('@')) {
                  return AppText.pleaseEnterValidEmail.tr();
                }
                return null;
              },
              borderRadius: 15,
              labelStyle: TextStyle(color: ColorsApp.primaryColor),
              style: TextStyle(color: ColorsApp.primaryColor),
              hintText: AppText.resetPasswordEmail.tr(),
              prefixIcon: const Icon(Icons.email),
              label: AppText.resetPasswordEmail.tr(),
            ),
            RSizedBox(height: 20),
            BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              listener: (context, state) {
                if (state.forgetPassword.isSuccess) {
                  /// don't forget navigation first
                  Navigator.pushReplacementNamed(context, RoutesName.login);
                  Loaders.showSuccessMessage(
                    message: AppText.resetPasswordSuccess.tr(),
                    context: context,
                  );
                } else if (state.forgetPassword.isFailure) {
                  Loaders.showErrorMessage(
                    message: state.forgetPassword.error?.message ?? AppText.someThingWentWrong.tr(),
                    context: context,
                  );
                }
              },
              builder: (context, state) {
                final cubit = context.read<ForgetPasswordCubit>();
                if (state.forgetPassword.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return CustomElevatedButton(
                  backgroundColor: state.isButtonDisabled
                      ? ColorsApp.primaryColor
                      : ColorsApp.greyColor,
                  onPressed: state.isButtonDisabled
                      ? () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.doIntent(
                        ForgetPasswordReset(
                          cubit.emailController.text,
                        )
                      );
                    }
                  }
                  : null,
                  buttonTitle: AppText.resetPasswordButton.tr(),
                  isStart: false,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

/// to be continue
