import 'package:good_eats/models/menu_items.dart';
import 'package:good_eats/models/product.dart';

class ResponseItems {
  //ResponseStatus status;
  String type;
  List<Product> menuItems;

  ResponseItems({required this.type, required this.menuItems}) : super();

  ResponseItems.fromJson(Map<String, dynamic> json) :
       //status = ResponseStatus.fromJson(json["status"]),
        type = json["type"],
        menuItems = List<Product>.from(json["menuItems"].map((x) => Product.fromJson(x)));

  Map<String, dynamic> toJson() {
    return {
      //'status': status,
      'type': type,
      'menuItems': menuItems
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

