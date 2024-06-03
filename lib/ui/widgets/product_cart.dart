// import 'package:flutter/material.dart';
// import 'package:good_eats/models/product.dart';
// import 'package:good_eats/ui/cart.dart';
// import 'package:provider/provider.dart';

// class ProductCard extends StatelessWidget {
//   final Product product;
//   const ProductCard({super.key, required this.product});

//   void _addToCartOnClick(BuildContext context) {
//     final cart = Provider.of<Cart>(context, listen: false);
//     cart.addToCart(product);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

import 'package:flutter/material.dart';
import 'package:good_eats/models/menu_item_response.dart';
import 'package:good_eats/models/product.dart';
import 'package:good_eats/ui/cart.dart';
import 'package:good_eats/util/colors.dart';
import 'package:good_eats/util/fonts.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  

  void _addToCartOnClick(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    cart.addToCart(product);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: NetworkImage(product.image),
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(3),
                topLeft: Radius.circular(3),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    product.title,
                    style: AppFonts.productCardTitle(),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 5),
                Text(product.restaurantChain,
                    style: AppFonts.productCardTDescription()),
              ],
            ),
          ),
          // const Expanded(
          //   child: SizedBox(),
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Text('\$' + product.price.toString(),
                //     style: AppFonts.productCardPrice()),
                MaterialButton(
                  onPressed: () => _addToCartOnClick(context),
                  color: AppColors.appBlue1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: <Widget>[
                      //Icon(Icons.add_shopping_cart, color: AppColors.appWhite),
                      Text('Add to cart', style: AppFonts.productCardBtn())
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
