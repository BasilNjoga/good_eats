import 'package:flutter/material.dart';
import 'package:good_eats/apiservice.dart';
import 'package:good_eats/models/menu_items.dart';
import 'package:good_eats/models/product.dart';
import 'package:good_eats/models/product_range.dart';
import 'package:good_eats/ui/widgets/cart_app_bar.dart';
import 'package:good_eats/ui/widgets/product_cart.dart';
import 'package:good_eats/util/app_variables.dart';
import 'package:good_eats/util/colors.dart';

import 'dart:developer' as devtools;

class ProductPage extends StatefulWidget {
  final Category category;

  const ProductPage({super.key,  required this.category});
  
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
 // ProductRange productRange = ProductRange(products: [
  //   Product(
  //       name: 'Bluebarries',
  //       description: 'Delicious blueberries from the wild.',
  //       category: Category.Food,
  //       price: 30.0,
  //       imageURL: 'images/Blueberries.jpg'),
  //   Product(
  //       name: 'Mario Game',
  //       description: 'Play as the famous plummer in the real world.',
  //       category: Category.Games,
  //       price: 70.0,
  //       imageURL: 'images/Mario.jpg'),
  //   Product(
  //     name: 'Dart',
  //     description: 'Simple dart game.',
  //     category: Category.Games,
  //     price: 20.0,
  //     imageURL: 'images/Dart.jpg',
  //   ),
  //   Product(
  //       name: 'Watermelon',
  //       description: 'Water and suger in a red solid form.',
  //       category: Category.Food,
  //       price: 40.0,
  //       imageURL: 'images/Watermelon.jpg'),
  //   Product(
  //       name: 'Candy Crush',
  //       description: 'Don\'t you have a phone?',
  //       category: Category.Games,
  //       price: 5.0,
  //       imageURL: 'images/Candy_Crush.jpg')
  // ]);

  List<Product> mymenuItems = [];
  Product? menuItem;

  @override 
  void initState() {
    APIService.getFoodItems().then((response){
      //devtools.log(response.menuItems[0].image.toString());
      setState(() {
        mymenuItems[0] = response.menuItems[0];
        //mymenuItems = (response.menuItems as List).map((e) => MenuItems.fromJson(e)).toList();
      });

      devtools.log(menuItem.toString());
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double statusbar = MediaQuery.of(context).padding.top;
    //final productRangeCategory = productRange.getFromCategory(widget.category);
    return Scaffold(
      body: Container(
        color: AppColors.appGray1,
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 56 + statusbar),
              child: GridView.count(
                childAspectRatio: (1 / 1.26),
                padding: const EdgeInsets.only(top: 10),
                crossAxisCount: 16,
                children: List.generate(mymenuItems.length, (index) {
                  final product = mymenuItems[index];
                  return ProductCard(product: product);
                }),
              ),
            ),
            CartAppBar(
              inHomePage: false,
              title: AppVariables.getCategoryString(widget.category),
            ),
          ],
        ),
      ),
    );
  }
}