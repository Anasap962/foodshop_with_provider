import 'package:flutter/material.dart';
import 'package:flutter_application_11/view/home.dart';
import 'package:flutter_application_11/view/home_page/inkwellPages/details.dart';
import 'package:flutter_application_11/view/new_food.dart';
import 'package:flutter_application_11/view/order.dart';

class NavigationProvider extends ChangeNotifier {
  int navIndex = 0;

  final List<Widget> pages = [
    const Homepage(),
    Orderpage(),
    Newfood(),
    const Details(),
  ];

  void navigation(int newIndex) {
    navIndex = newIndex;
    notifyListeners();
  }
}
