import 'package:flutter/material.dart';
import 'package:good_eats/models/product.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class MenuDatabase extends ChangeNotifier{
  static late Isar isar;

  // INITIALIZE
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [ProductSchema],
      directory: dir.path,
    );
  }

  // menu list
  final List<Product> currentMenu = [];

  // CREATE
  Future<void> addMenu(Product apiMenu) async {
    // create a new menu item
    final newMenu = Product() = apiMenu;

    //final newMenu = Menu()..title = text;


    // save to db
    await isar.writeTxn(() => isar.products.put(newMenu));

    // re-read from db
    fetchMenu();
  }

  // READ
  Future<void> fetchMenu() async {
    List<Product> fetchedMenu = await isar.products.where().findAll();
    currentMenu.clear();
    currentMenu.addAll(fetchedMenu);
    notifyListeners();
  }

  Future<int> countValues() async {
    final count = await isar.products.count();
    return count;
  }

  // UPDATE
  Future<void> updateMenu(int id, String name) async {
    final existingMenu = await isar.products.get(id);
    if (existingMenu != null) {
      existingMenu.title = name;
      await isar.writeTxn(() => isar.products.put(existingMenu));
      await fetchMenu();
    }
  }

  // DELETE
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.products.delete(id));
    await fetchMenu();
  }
}