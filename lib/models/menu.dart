import 'package:isar/isar.dart';

part 'menu_items.g.dart';

@Collection()
class Menu {
  late Id id;
  late String title;
  late String image;
  late String restaurantChain;
  //Id id = Isar.autoIncrement;
  //late String title;
}
