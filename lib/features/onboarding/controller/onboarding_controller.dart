import 'package:flutter/material.dart';

class OnboardingController with ChangeNotifier {
  int? currentIndex;
  final PageController pageController = PageController();
  bool lastPage = false;

  void onPageChanged(int index) {
    currentIndex = index;
    if (currentIndex == 2) {
      lastPage = true;
    } else {
      lastPage = false;
    }
    notifyListeners();
  }
}
