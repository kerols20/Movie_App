import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../screen_app/explore.dart';
import '../../../screen_app/profile.dart';
import '../../../screen_app/search.dart';
import '../../get_movie/view/get_movie_view.dart';
import 'bottom_navigation_bar_intent.dart';
import 'bottom_navigation_bar_state.dart';


class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(const BottomNavigationBarState());

  final List<Widget> pages = [
    GetMovieView(),
    Search(),
    Explore(),
    Profile()
  ];

  void doIntent(BottomNavigationBarIntent intent) {
    switch (intent) {
      case SelectedIndex():
        _selectedIndex(intent.index);
        break;
    }
  }

  void _selectedIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
