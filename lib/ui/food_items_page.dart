import 'package:flutter/material.dart';
import 'package:good_eats/apiservice.dart';

import 'dart:developer' as devtools;

import 'package:good_eats/models/menu_item_response.dart';

class FoodItemsPage extends StatefulWidget {
  static const routeName = "fooditems";
  const FoodItemsPage({super.key});

  @override
  State<FoodItemsPage> createState() => _FoodItemsPageState();
}

class _FoodItemsPageState extends State<FoodItemsPage> {
  final textController = TextEditingController();
  List<Product> mymenuItems = [];
  //Food? menuItem;

  @override
void initState() {
  super.initState();
  APIService.getFoodItems().then((response){
    setState(() {
      // Your state update logic
      mymenuItems = response.menuItems;//(response.menuItems as List).map((e) => Food.fromJson(e)).toList();
    });
    devtools.log(mymenuItems.toString());
  }).catchError((error) {
    devtools.log('Error: $error');
  });
}


  @override
  Widget build(BuildContext context) {
    // final menuDatabase = context.watch<MenuDatabase>();

    // List<Menu> currentMenu = menuDatabase.currentMenu;
    
    return Scaffold(
      appBar: AppBar(title: const Text("Menu"),),
      body: 
      Column(children: [ 
        Container(
          height: 400,
          child: ListView.builder(
          itemCount: mymenuItems.length,
          itemBuilder: (context, index) {
          //final note = currentMenu[index];
          
          return ListTile(
            leading: SizedBox(height: 50, width: 50, child: Image.network(mymenuItems[index].image)),
            title: Text(mymenuItems[index].title)
          );
                }),
        )
      ],)
      

    );
  }
}