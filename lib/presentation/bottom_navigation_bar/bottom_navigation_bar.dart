import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bottom_navigation_bar/view_model/bottom_navigation_bar_cubit.dart';
import 'package:movie_app/presentation/bottom_navigation_bar/view_model/bottom_navigation_bar_intent.dart';
import 'package:movie_app/presentation/bottom_navigation_bar/view_model/bottom_navigation_bar_state.dart';

import '../../core/constant_app/colors_app.dart';
import '../../core/constant_app/icons_app.dart';
class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBarCubit(),
      child: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
        builder: (context, state) {
          final cubit = context.read<BottomNavigationBarCubit>();
          return Scaffold(
            body: cubit.pages[state.currentIndex],
            bottomNavigationBar:  BottomNavigationBar(
              backgroundColor: Color(0xff282A28),
              unselectedItemColor: ColorsApp.greyColor,
              selectedItemColor: ColorsApp.primaryColor,
                onTap: (index) => cubit.doIntent(SelectedIndex(index)),
                currentIndex: state.currentIndex,
                type: BottomNavigationBarType.fixed,
                iconSize: 20,
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      IconsApp.home,
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                      color: state.currentIndex == 0
                          ? ColorsApp.primaryColor
                          : ColorsApp.greyColor,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(IconsApp.search,  width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                      color: state.currentIndex == 1
                          ? ColorsApp.primaryColor
                          : ColorsApp.greyColor,
                    ),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(IconsApp.explore, width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                      color: state.currentIndex == 2
                          ? ColorsApp.primaryColor
                          : ColorsApp.greyColor
                    ),
                    label: 'Expolre',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(IconsApp.profile, width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                      color: state.currentIndex == 3
                          ? ColorsApp.primaryColor
                          : ColorsApp.greyColor,
                    ),
                    label: 'Profile',
                  ),
                ]),
          );
        },
      ),
    );
  }
}
