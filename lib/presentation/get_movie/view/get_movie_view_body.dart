import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constant_app/colors_app.dart';
import '../../get_details_movie/view/get_details_movies_view.dart';
import '../view_model/get_movie_cubit.dart';
import '../view_model/get_movie_state.dart';
class GetMovieViewBody extends StatelessWidget {
  const GetMovieViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<GetMovieCubit, GetMovieState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<GetMovieCubit>();
          final movies = state.stateStatus.data?.movie ?? [];

          if (state.stateStatus.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (movies.isEmpty) {
            return const Center(
              child: Text(
                "No movies found.",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 600),
                      child: Container(
                        key: ValueKey(state.currentImageIndex),
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              movies[state.currentImageIndex].mediumCoverImage!,
                            ),
                            fit: BoxFit.cover,
                            colorFilter: const ColorFilter.mode(
                              Color(0xF2000000),
                              BlendMode.dstATop,
                            ),
                            onError: (exception, stackTrace) {
                              debugPrint("❌ Error loading image: $exception");
                            },
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10.h,
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          'assets/image/Available Now.png',
                          width: 250.w,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 400.h,
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          'assets/image/Watch Now.png',
                          width: 250.w,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 400.h,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
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
                      ),
                    ),
                    Positioned(
                      top: 520.h,
                      left: 10,
                      right: 10,
                      child: Row(
                        children: [
                          const Text(
                            'Action',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  'See More',
                                  style: TextStyle(
                                    color: ColorsApp.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_outlined,
                                  color: ColorsApp.primaryColor,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 100.h),
                      child: CarouselSlider(
                        items: movies.map((movie) {
                          return GestureDetector(
                            onTap: () {
                              final movieId = movie.id;
                              Navigator.push(context, MaterialPageRoute(builder: (context) => GetDetailsMoviesView(movieId: movieId!),));
                            },
                            child: Container(
                              width: 200.w,
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                image: DecorationImage(
                                  image: NetworkImage(movie.mediumCoverImage!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            cubit.changeImageIndex(index);
                          },
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 5),
                          viewportFraction: 0.6,
                          height: 300.h,
                          enlargeCenterPage: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
/// test@gmail.com
