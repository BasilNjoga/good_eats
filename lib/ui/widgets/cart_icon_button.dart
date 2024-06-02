import 'package:flutter/material.dart';
import 'package:good_eats/ui/cart.dart';
import 'package:good_eats/util/colors.dart';
import 'package:good_eats/util/fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CartIconButton extends StatelessWidget {
  final Function cartOnClick;

  const CartIconButton({super.key, required this.cartOnClick,});

 

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return IconButton(
      icon: Container(
        height: 50,
        width: 50,
        child: Stack(
          children: <Widget>[
            Center(
              child: Icon(
                Icons.shopping_cart,
                color: AppColors.appWhite,
              ),
            ),
            Container(
              width: 15,
              height: 15,
              margin: const EdgeInsets.fromLTRB(18, 6, 0, 0),
              padding: const EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                color: AppColors.appRed,
                shape: BoxShape.circle,
              ),
              child: Observer(
                builder: (_) => Center(
                  child: Text(
                    '${cart.cartContent.length}',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppFonts.cartQuantityNumber(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onPressed: () => cartOnClick(),
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 15.0),
    );
  }
}