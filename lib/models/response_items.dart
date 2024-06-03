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



// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:good_eats/models/food.dart';

// part 'response_items.freezed.dart';
// part 'response_items.g.dart';

// @freezed
// class ResponseItems with _$ResponseItems{
//   const factory ResponseItems({
//     required String type,
//     required List<Food> menuItem,
//   }) = _ResponseItems;

//   factory ResponseItems.fromJson(Map<String, dynamic> json) => _$ResponseItemsFromJson(json);
// }