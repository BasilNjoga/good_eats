import 'package:isar/isar.dart';

part 'product.g.dart';

@Collection()
class Product {
  Id id;
  String title;
  String image;
  String imageType;
  String restaurantChain;
  //final Servings servings;

  Product ({
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
    required this.restaurantChain,
    //required this.servings,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      imageType: json['imageType'],
      restaurantChain: json['restaurantChain'],
      //servings: Servings.fromJson(json['servings']),
    );
  }
}