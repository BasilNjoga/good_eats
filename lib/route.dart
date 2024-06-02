import 'package:flutter/material.dart';
import 'package:good_eats/ui/food_items_page.dart';
import 'package:good_eats/ui/home_screen.dart';


Route? getRoute(RouteSettings settings, ) {
  final Widget screen;
  String name = settings.name ?? '/';
  switch (settings.name) {
    case HomeScreen.routeName:
      screen = HomeScreen();
      break;
    case FoodItemsPage.routeName:
      screen = const FoodItemsPage();
      break;
    default:
      screen = HomeScreen();
  }
  return MaterialPageRoute(
    settings: RouteSettings(name: name), builder:(context) => screen);
}