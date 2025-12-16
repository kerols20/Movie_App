import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constant_app/colors_app.dart';
import 'package:movie_app/core/constant_app/icons_app.dart';
import '../../../core/customs/custom_elevated_button.dart';
import '../view_model/get_details_movie_cubit.dart';
import '../view_model/get_details_movie_state.dart';
import '../widget/count_widget.dart';
class GetDetailsMoviesViewBody extends StatelessWidget {
  const GetDetailsMoviesViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocBuilder<GetDetailsMovieCubit, GetDetailsMovieState>(
          builder: (context, state) {
            if (state.stateStatus.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.stateStatus.isSuccess) {
              final details = state.stateStatus.data;
              final movie = details?.data?.movie;
              return Stack(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 600),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(movie?.mediumCoverImage ?? ""),
                          fit: BoxFit.cover,
                          colorFilter: const ColorFilter.mode(
                            Color(0xF2000000),
                            BlendMode.dstATop,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                         SizedBox(height: 248.h),
                        Center(
                          child: Image.asset(IconsApp.play, width: 100.w, height: 100.h),
                        ),
                         SizedBox(height: 150.h),
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Color(0xF2000000),
                                Colors.black,
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 100.h),
                              Text(
                                movie?.titleLong ?? "",
                                style: const TextStyle(
                                  overflow: TextOverflow.visible,
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: CustomElevatedButton(
                                  backgroundColor: ColorsApp.redColor,
                                  onPressed: () {},
                                  buttonTitle: "Watch Now",
                                  isStart: false,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CountWidget(
                                        iconPath: IconsApp.clock,
                                        value: movie?.runtime ?? 0,
                                      ),
                                    ),
                                    Expanded(
                                      child: CountWidget(
                                        iconPath: IconsApp.star,
                                        value: movie?.rating ?? 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.h),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.r),
                                child: Container(
                                  width: double.infinity,
                                  height: 150.h,
                                  color: ColorsApp.secondColor,
                                  child: Image.network(
                                    movie?.backgroundImageOriginal ?? "",
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ),
                              SizedBox(height: 10.h),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.r),
                                child: Container(
                                  width: double.infinity,
                                  height: 150.h,
                                  color: ColorsApp.secondColor,
                                  child: Image.network(
                                    movie?.mediumCoverImage ?? "",
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            if (state.stateStatus.isFailure) {
              return Text("Error: ${state.stateStatus.error}");
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
