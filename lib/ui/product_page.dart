import 'package:flutter/material.dart';
import 'package:good_eats/apiservice.dart';
import 'package:good_eats/menu_database.dart';
import 'package:good_eats/models/product.dart';
import 'package:good_eats/ui/widgets/cart_app_bar.dart';
import 'package:good_eats/ui/widgets/product_cart.dart';
import 'package:good_eats/util/app_variables.dart';
import 'package:good_eats/util/colors.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as devtools;

class ProductPage extends StatefulWidget {
  final Category category;

  const ProductPage({super.key, required this.category});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Product> mymenuItems = [];
  Product? menuItem;

  @override
  void initState() {
    super.initState();
    initializeMenu();
  }

  Future<void> initializeMenu() async {
    final menuDatabase = context.read<MenuDatabase>();
    final count = await menuDatabase.countValues();

    if (count == 0) {
      // If database is empty, fetch data from API and add to the database
      try {
        final response = await APIService.getFoodItems();
        mymenuItems = response.menuItems;

        for (var item in mymenuItems) {
          await menuDatabase.addMenu(item);
        }

        devtools.log('Data fetched from API and added to the database.');
      } catch (error) {
        devtools.log('Error fetching data from API: $error');
      }
    } else {
      // If database is not empty, read data from the database
      await menuDatabase.fetchMenu();
      mymenuItems = menuDatabase.currentMenu;
      devtools.log('Data fetched from the local database.');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double statusbar = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        color: AppColors.appGray1,
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 56 + statusbar),
              child: GridView.count(
                childAspectRatio: 1.4, //(1 / 1.26),
                padding: const EdgeInsets.only(top: 10),
                crossAxisCount: 1,
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
