import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constant_app/app_text.dart';
import 'package:movie_app/core/customs/custom_elevated_button.dart';
import 'package:movie_app/core/customs/custom_text_form_field.dart';

import '../../../core/constant_app/colors_app.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(AppText.register, style: TextStyle(color: ColorsApp.primaryColor),),
        centerTitle: true,
        leading: IconButton(
          color: ColorsApp.primaryColor,
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          RSizedBox(height: 50.h,),
          Padding(
            padding:  REdgeInsets.symmetric(horizontal: 16),
            child: CustomTextFormField(
              hintText: AppText.name,
              hintStyle: TextStyle(color: ColorsApp.primaryColor),
              style: TextStyle(color: ColorsApp.primaryColor),
              prefixIcon: ImageIcon(AssetImage('assets/icon/🦆 icon _Identification_.png')),
              borderRadius: 13,
            label: AppText.name,
              labelStyle: TextStyle(color: ColorsApp.primaryColor),
            ),
          ),
          SizedBox(height: 20.h,),
          Padding(
            padding:  REdgeInsets.symmetric(horizontal: 16),
            child: CustomTextFormField(
              labelStyle: TextStyle(color: ColorsApp.primaryColor),
              style: TextStyle(color: ColorsApp.primaryColor),
              borderRadius: 15,
              hintText: AppText.email.tr(),
              prefixIcon: const Icon(Icons.email),
              label: AppText.email.tr(),
            ),
          ),
          SizedBox(height: 20.h,),
         Padding(
        padding:  REdgeInsets.symmetric(horizontal: 16),
        child: CustomTextFormField(
          labelStyle: TextStyle(color: ColorsApp.primaryColor),
          style: TextStyle(color: ColorsApp.primaryColor),
          label: AppText.password.tr(),
          prefixIcon: const Icon(Icons.lock),
          obscureText: true,
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.visibility_off),
          ),
        ),
      ),
          SizedBox(height: 20.h,),
         Padding(
        padding:  REdgeInsets.symmetric(horizontal: 16),
        child: CustomTextFormField(
          labelStyle: TextStyle(color: ColorsApp.primaryColor),
          style: TextStyle(color: ColorsApp.primaryColor),
          label: AppText.confirmPassword.tr(),
          prefixIcon: const Icon(Icons.lock),
          obscureText: true,
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.visibility_off),
          ),
        ),
      ),
          SizedBox(height: 20.h,),
          Padding(
            padding:  REdgeInsets.symmetric(horizontal: 16),
            child: CustomTextFormField(
              labelStyle: TextStyle(color: ColorsApp.primaryColor),
              style: TextStyle(color: ColorsApp.primaryColor),
              label: AppText.phone,
              prefixIcon: const Icon(Icons.phone),
              borderRadius: 15,
            )
          ),
          SizedBox(height: 20.h,),
          Padding(
            padding:  REdgeInsets.symmetric(horizontal: 16),
            child: CustomElevatedButton(
              backgroundColor: ColorsApp.primaryColor,
              onPressed: () {},
              buttonTitle: AppText.createAccount,
              isStart: false
            ),
          ),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppText.alreadyHaveAnAccount.tr(),
                style: TextStyle(color: ColorsApp.whiteColor),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  AppText.createOne.tr(),
                  style: TextStyle(color: ColorsApp.primaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
