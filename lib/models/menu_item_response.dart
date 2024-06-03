import 'package:good_eats/models/product.dart';

class MenuItemResponse {
  final String type;
  final List<Product> menuItems;
  final int offset;
  final int number;
  final int totalMenuItems;
  final int processingTimeMs;

  MenuItemResponse({
    required this.type,
    required this.menuItems,
    required this.offset,
    required this.number,
    required this.totalMenuItems,
    required this.processingTimeMs,
  });

  factory MenuItemResponse.fromJson(Map<String, dynamic> json) {
    return MenuItemResponse(
      type: json['type'],
      menuItems: (json['menuItems'] as List).map((item) => Product.fromJson(item)).toList(),
      offset: json['offset'],
      number: json['number'],
      totalMenuItems: json['totalMenuItems'],
      processingTimeMs: json['processingTimeMs'],
    );
  }
}



class Servings {
  final double number;
  final double? size;
  final String? unit;

  Servings({
    required this.number,
    this.size,
    this.unit,
  });

  factory Servings.fromJson(Map<String, dynamic> json) {
    return Servings(
      number: json['number'],
      size: json['size'] != null ? json['size'].toDouble() : null,
      unit: json['unit'],
    );
  }
}
