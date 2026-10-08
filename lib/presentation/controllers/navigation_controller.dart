import 'package:flutter/material.dart';

class NavigationController extends ChangeNotifier {
  int currentIndex = 0;
 void toggleIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
