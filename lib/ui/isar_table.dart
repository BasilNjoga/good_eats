import 'package:flutter/material.dart';
import 'package:good_eats/apiservice.dart';
import 'package:good_eats/models/menu_database.dart';
import 'package:good_eats/models/menu.dart';
import 'package:good_eats/models/menu_item_response.dart';
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

    APIService.getFoodItems().then((response){
    setState(() {
      // Your state update logic
      mymenuItems = response.menuItems;//(response.menuItems as List).map((e) => Food.fromJson(e)).toList();
      //context.read<MenuDatabase>().addMenu(mymenuItems[0]);
    });
    devtools.log(mymenuItems.toString());
  }).catchError((error) {
    devtools.log('Error: $error');
  });

    readMenu();
    number();
  }
   // create a note

   void createNote() {
    // showDialog(
    //   context: context, 
    //   builder: (context) => AlertDialog(
    //   content: TextField(
    //     controller: textController,
    //   ),
    //   actions: [
    //     MaterialButton(
    //       onPressed: () {
    //         context.read<MenuDatabase>().addMenu(textController.text);
    //         textController.clear();

    //         // pop dialoge
    //         Navigator.pop(context);
    //       },
    //       child: const Text("Create"),)
    //   ],
    // ),
    // );
   }
   // add notes
   void readMenu() {
    context.read<MenuDatabase>().fetchMenu();
   }

   Future<int> number() {
    var count = context.read<MenuDatabase>().countValues();
    devtools.log(count.toString());
    return count;
   }

   // check if empty
  

   // update notes

   // delete notes
  @override
  Widget build(BuildContext context) {
    final menuDatabase = context.watch<MenuDatabase>();

    //List<Menu> currentMenu = menuDatabase.currentMenu;
    
    return Scaffold(
      appBar: AppBar(title: const Text("Menu"),),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote),
      body: 
      Column(children: [ 
        const Text("Hello world"),
        Container(
          height: 400,
          child: ListView.builder(
          //itemCount: currentMenu.length,
          itemBuilder: (context, index) {
          //final note = currentMenu[index];
          
          return ListTile(
            //title: Text(note.title)
          );
                }),
        )
      ],)
      

    );
  }
}