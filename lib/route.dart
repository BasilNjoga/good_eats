import 'package:flutter/material.dart';
import 'package:good_eats/ui/food_items_page.dart';
import 'package:good_eats/ui/home_screen.dart';
import 'package:good_eats/ui/isar_table.dart';
import 'package:good_eats/ui/login_screen.dart';
import 'package:good_eats/ui/register_screen.dart';


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
    case FoodTablePage.routeName:
      screen = const FoodTablePage();
      break;
    case LoginScreen.routeName:
      screen = const LoginScreen();
      break;
    case RegisterScreen.routeName:
      screen = const RegisterScreen();
      break;
    default:
      screen = const HomeScreen();
  }
  return MaterialPageRoute(
    settings: RouteSettings(name: name), builder:(context) => screen);
}