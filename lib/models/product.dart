
class Product {

  int id;
  String title;
  String image;
  String restaurantChain;

  
  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.restaurantChain,

  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      restaurantChain: json["restaurantChain"]
      );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': title,
      'title': image,
      'restaurantChain': restaurantChain,
    };
  }


  @override
  bool operator ==(dynamic o) => o is Product && o.title == title;

  @override
  int get hashCode => title.hashCode;
}