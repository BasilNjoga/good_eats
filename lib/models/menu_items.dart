import 'package:isar/isar.dart';

part 'menu_items.g.dart';

@Collection()
class Menu {
  Id id = Isar.autoIncrement;
  late String title;
}

// class MenuItems{
//   int id;
//   String title;
//   String image;
//   String restaurantChain;

//   MenuItems({
//     required this.id,
//     required this.title,
//     required this.image,
//     required this.restaurantChain,
// });

//   factory MenuItems.fromJson(Map<String, dynamic> json) {
//     return MenuItems(
//       id: json["id"],
//       title: json["title"],
//       image: json["image"],
//       restaurantChain: json["restaurantChain"]
//       );
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': title,
//       'title': image,
//       'restaurantChain': restaurantChain,
//     };
//   }

//   @override
//   String toString() => toJson().toString();
// }