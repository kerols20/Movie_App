import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'on_boarding_intent.dart';
import 'on_boarding_state.dart';
class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingState());
  final PageController _pageController = PageController();
  final List<String> _images = [
    "assets/image/film4.png",
    "assets/image/img.png",
    "assets/image/img_1.png"
  ];

  List<String> get images => _images;
  void intent(OnBoardingIntent intent) {
    switch (intent) {
      case NextPageIntent _:
        _nextPage();
        break;
      case PreviousPageIntent _:
        _previousPage();
        break;
      case PageChangedIntent _:
        _onPageChanged((intent).pageIndex);
        break;
      case JumpToPageIntent _:
        _jumpToPage((intent).pageIndex);
        break;
    }
  }
  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
  void _onPageChanged(int pageIndex) {
    emit(state.copyWith(pageIndex: pageIndex));
  }
  void _jumpToPage(int pageIndex) {
    _pageController.jumpToPage(pageIndex);
  }
  void dispose() {
    _pageController.dispose();
    super.close();
  }
  PageController get pageController => _pageController;

}
