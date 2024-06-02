import 'package:flutter/material.dart';
import 'package:good_eats/apiservice.dart';
import 'package:good_eats/models/menu_database.dart';
import 'package:good_eats/models/menu_items.dart';

import 'package:provider/provider.dart';

class FoodItemsPage extends StatefulWidget {
  static const routeName = "fooditems";
  const FoodItemsPage({super.key});

  @override
  State<FoodItemsPage> createState() => _FoodItemsPageState();
}

class _FoodItemsPageState extends State<FoodItemsPage> {
  final textController = TextEditingController();
  // List<Product> mymenuItems = [];
  // Product? menuItem;
  // @override 
  // void initState() {
  //   APIService.getFoodItems().then((response){
  //     //devtools.log(response.menuItems[0].image.toString());
  //     setState(() {
  //       menuItem = response.menuItems[0];
  //       //mymenuItems = (response.menuItems as List).map((e) => MenuItems.fromJson(e)).toList();
  //     });

  //     devtools.log(menuItem.toString());
  //   });
    
  //   super.initState();
  // }


  @override
  void initState() {
    super.initState();

    readMenu();
  }
   // create a not

   void createNote() {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
      content: TextField(
        controller: textController,
      ),
      actions: [
        MaterialButton(
          onPressed: () {
            context.read<MenuDatabase>().addMenu(textController.text);
            //context.read<MenuDatabase>().addMenu(textController.text);

            // clear controller
            textController.clear();

            // pop dialoge
            Navigator.pop(context);
          },
          child: const Text("Create"),)
      ],
    ));
   }
   // add notes
   void readMenu() {
    context.read<MenuDatabase>().fetchMenu();
   }

   // update notes

   // delete notes
  @override
  Widget build(BuildContext context) {
    final menuDatabase = context.watch<MenuDatabase>();

    List<Menu> currentMenu = menuDatabase.currentMenu;
    
    return Scaffold(
      appBar: AppBar(title: const Text("Menu"),),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote),
      body: 
      Column(children: [ 
        Text("Hello world"),
        Container(
          height: 400,
          child: ListView.builder(
          itemCount: currentMenu.length,
          itemBuilder: (context, index) {
          final note = currentMenu[index];
          
          return ListTile(
            title: Text(note.title)
          );
                }),
        )
      ],)
      

    );
  }
}