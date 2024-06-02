import 'package:good_eats/models/product.dart';
import 'package:good_eats/util/app_variables.dart';

class ProductRange {
  ProductRange({required this.products});

  final List<Product> products;

  List<Product> getFromCategory(Category category) {
    final List<Product> specificProducts = products.toList();
    return specificProducts;
  }
}
