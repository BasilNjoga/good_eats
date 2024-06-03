import 'package:flutter/material.dart';
import 'package:good_eats/apiservice.dart';
import 'package:good_eats/menu_database.dart';
import 'package:good_eats/models/product.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as devtools;

class FoodTablePage extends StatefulWidget {
  static const routeName = "foodtable";
  const FoodTablePage({super.key});

  @override
  State<FoodTablePage> createState() => _FoodTablePageState();
}

class _FoodTablePageState extends State<FoodTablePage> {
  final textController = TextEditingController();
  List<Product> mymenuItems = [];

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
      devtools.log('Data fetched from the local database.');
    }
  }

  void createNote() {
    // Show dialog to create a new menu item
  }

  void readMenu() {
    context.read<MenuDatabase>().fetchMenu();
  }

  Future<int> number() async {
    final count = await context.read<MenuDatabase>().countValues();
    devtools.log(count.toString());
    return count;
  }

  @override
  Widget build(BuildContext context) {
    final menuDatabase = context.watch<MenuDatabase>();
    List<Product> currentMenu = menuDatabase.currentMenu;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: createNote),
      body: Column(
        children: [
          const Text("Hello world"),
          Container(
            height: 400,
            child: ListView.builder(
              itemCount: currentMenu.length,
              itemBuilder: (context, index) {
                final product = currentMenu[index];
                return ListTile(
                  title: Text(product.title),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
