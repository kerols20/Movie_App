import 'package:equatable/equatable.dart';

class BottomNavigationBarState extends Equatable {
  final int currentIndex;

  const BottomNavigationBarState({this.currentIndex = 0});

  BottomNavigationBarState copyWith({
    int? currentIndex,
  }) {
    return BottomNavigationBarState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object> get props => [currentIndex];
}
