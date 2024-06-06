import 'package:flutter/material.dart';

class IndexProvider extends ChangeNotifier {
  int selectedIndex = 0;

  var pageController = PageController(
    initialPage: 0,
    keepPage: true,
    viewportFraction: 1,
  );

  changeBottomIndex(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
    );
    selectedIndex = index;
    notifyListeners();
    // log('selectedIndex : $selectedIndex');
  }
}
