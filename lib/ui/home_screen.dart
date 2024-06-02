// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   static const routeName = "home-screen";
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: const Column(children: [
//         Text("good eats")
//       ],)
//     );
//   }
// } 
import 'package:flutter/material.dart';
import 'package:good_eats/ui/food_items_page.dart';
import 'package:good_eats/ui/widgets/cart_app_bar.dart';
import 'package:good_eats/ui/widgets/category_card.dart';
import 'package:good_eats/util/app_variables.dart';
import 'package:good_eats/util/colors.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "routeName";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double statusbar = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              color: AppColors.appGray1,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 56 + statusbar),
                    child: ListView(
                      padding: EdgeInsets.only(top: 10),
                      children: <Widget>[
                        // CategoryCard(
                        //     title: 'Games',
                        //     text: 'Diverse library of games for all platforms.',
                        //     color: AppColors.appBlue1,
                        //     iconData: Icons.gamepad,
                        //     category: Category.Games),
                        CategoryCard(
                            title: 'Food',
                            text: 'We have food for any occasion.',
                            color: AppColors.appGreen,
                            iconData: Icons.fastfood,
                            category: Category.Food),
                      ],
                    ),
                  ),
                  const CartAppBar(
                    title: 'State Management',
                    inHomePage: true,
                  ),
                ],
              ),
            ),
        
            MaterialButton(
              color: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context, FoodItemsPage.routeName);
            }, child: const Text("All Meals"))
          ],
        ),
      ),
    );
  }
}