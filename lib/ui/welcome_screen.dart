import 'package:flutter/material.dart';
import 'package:good_eats/ui/isar_table.dart';
import 'package:good_eats/ui/widgets/cart_app_bar.dart';
import 'package:good_eats/ui/widgets/category_card.dart';
import 'package:good_eats/ui/widgets/food_slider.dart';
import 'package:good_eats/util/app_variables.dart';
import 'package:good_eats/util/colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double statusbar = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              //color: AppColors.appGray1,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 56 + statusbar),
                    child: ListView(
                      padding: const EdgeInsets.only(top: 10),
                      children: const <Widget>[
                        // CategoryCard(
                        //     title: 'Games',
                        //     text: 'Diverse library of games for all platforms.',
                        //     color: AppColors.appBlue1,
                        //     iconData: Icons.gamepad,
                        //     category: Category.Games),
                        CategoryCard(
                            title: 'Food',
                            text: 'We have food for any occasion.',
                            color: AppColors.appBrown,
                            iconData: Icons.fastfood,
                            category: Category.Food),
                      ],
                    ),
                  ),
                  const CartAppBar(
                    title: 'Good Eats',
                    inHomePage: true,
                  ),
                ],
              ),
            ),
            const FoodSlider(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Pick From our wide variety of low calorie meals today",textAlign: TextAlign.center, style: TextStyle(fontSize: 17),),
            ),
            // MaterialButton(
            //   color: Colors.brown,
            //   onPressed: () {
            //     Navigator.pushNamed(context, FoodTablePage.routeName);
            // }, child: const Text("All Meals"))
          ],
        ),
      ),
    );
  }
}