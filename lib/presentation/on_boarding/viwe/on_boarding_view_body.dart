import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/auth/login/view/login_view.dart';
import '../../../core/constant_app/app_text.dart';
import '../../../core/constant_app/colors_app.dart';
import '../../../core/customs/custom_elevated_button.dart';
import '../viwe_model/on_boarding_cubit.dart';
import '../viwe_model/on_boarding_intent.dart';
import '../viwe_model/on_boarding_state.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBoardingCubit>();
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              controller: cubit.pageController,
              itemCount: cubit.images.length,
              onPageChanged: (index) {
                cubit.intent(PageChangedIntent(index));
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  cubit.images[index],
                  fit: BoxFit.cover,
                );
              },
            ),
            BlocBuilder<OnBoardingCubit, OnBoardingState>(builder: (context, state) {
              final isLastPage = state.pageIndex == cubit.images.length - 1;
              if (isLastPage) {
                return const SizedBox.shrink();
              }
              return Positioned(
                  top: 20,
                  right: 0,
                  child: TextButton(
                    onPressed: () {
                      cubit.intent(JumpToPageIntent(
                        cubit.images.length - 1,
                      ));
                    },
                    child: Text(
                      AppText.skip.tr(),
                      style: TextStyle(
                        color: ColorsApp.redColor,
                        fontSize: 15,
                      ),
                    ),
                  ));
            }),
            BlocBuilder<OnBoardingCubit, OnBoardingState>(
              builder: (context, state) {
                final isFirstPage = state.pageIndex == 0;
                final isLastPage = state.pageIndex == cubit.images.length - 1;
                final containerHeight = isFirstPage ? 250.0 : 300.0;
                return Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: containerHeight,
                    decoration: const BoxDecoration(
                      color: ColorsApp.blackColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                           Text(
                            AppText.discoverYourMovies.tr(),
                            style: TextStyle(
                                color: ColorsApp.whiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                           Text(
                            AppText.description.tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorsApp.whiteColor,
                              fontSize: 15,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 20),
                          if (isFirstPage)
                            CustomElevatedButton(
                              onPressed: () {
                                cubit.intent(NextPageIntent());
                              },
                              buttonTitle: AppText.next.tr(),
                              isStart: false,
                            )
                          else
                            Column(
                              children: [
                                CustomElevatedButton(
                                  onPressed: () {
                                    if (isLastPage) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginView(),
                                          ),
                                      );
                                    } else {
                                      cubit.intent(NextPageIntent());
                                    }
                                  },
                                  buttonTitle:
                                      isLastPage ? AppText.getStarted.tr() : AppText.next.tr(),
                                  isStart: false,
                                ),
                                const SizedBox(height: 20),
                                CustomElevatedButton(
                                  onPressed: () {
                                    cubit.intent(PreviousPageIntent());
                                  },
                                  buttonTitle: AppText.back.tr(),
                                  isStart: false,
                                ),
                              ],
                            ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
