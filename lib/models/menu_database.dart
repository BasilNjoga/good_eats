import 'package:flutter/material.dart';
import 'package:good_eats/models/menu_items.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class MenuDatabase extends ChangeNotifier{
  static late Isar isar;

  // INITIALIZE
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [MenuSchema],
      directory: dir.path,
    );
  }

  // menu list
  final List<Menu> currentMenu = [];

  // CREATE
  Future<void> addMenu(String text) async {
    // create a new menu item
    final newMenu = Menu()..title = '';

    // save to db
    await isar.writeTxn(() => isar.menus.put(newMenu));

    // re-read from db
    fetchMenu();
  }

  // READ
  Future<void> fetchMenu() async {
    List<Menu> fetchedMenu = await isar.menus.where().findAll();
    currentMenu.clear();
    currentMenu.addAll(fetchedMenu);
    notifyListeners();
  }

  // UPDATE
  Future<void> updateMenu(int id, String name) async {
    final existingMenu = await isar.menus.get(id);
    if (existingMenu != null) {
      existingMenu.title = name;
      await isar.writeTxn(() => isar.menus.put(existingMenu));
      await fetchMenu();
    }
  }

  // DELETE
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.menus.delete(id));
    await fetchMenu();
  }
}