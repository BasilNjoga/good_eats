import 'package:flutter/material.dart';
import 'package:good_eats/models/menu_item_response.dart';
import 'package:good_eats/models/product.dart';
import 'package:good_eats/ui/cart.dart';
import 'package:good_eats/ui/widgets/app_dialogue.dart';
import 'package:good_eats/util/colors.dart';
import 'package:good_eats/util/fonts.dart';
import 'package:provider/provider.dart';


class CartListTile extends StatefulWidget {
  final Product product;
  final int quantity;

  const CartListTile({
    super.key,
    required this.product,
    required this.quantity,
  });

 

  @override
  _CartListTileState createState() => _CartListTileState();
}

class _CartListTileState extends State<CartListTile> {
  int quantity = 0;
  Cart? cart;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cart = Provider.of(context, listen: false);
  }

  @override
  void initState() {
    quantity = widget.quantity;
    super.initState();
  }

  Future<void> tileOnClick() async {
    quantity = await AppDialog.quantityDialog(
      context: context,
      title: 'Quantity',
      quantity: widget.quantity,
    );

    cart!.changeQuantity(widget.product, quantity);
  }

  void tileOnSwipe(Product product) {
    cart!.removeAllFromCart(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        tileOnSwipe(widget.product);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 4),
        color: AppColors.appWhite,
        child: ListTile(
          title: Text(
            widget.product.title,
            style: AppFonts.cartTileTitle(),
          ),
          subtitle: Text(
            'Quantity: ${widget.quantity}',
            style: AppFonts.cartTileSubTitle(),
          ),
          trailing: Container(
              child: Text(
            '\$${5 * widget.quantity}',
            style: AppFonts.cartTileValue(),
          )),
          onTap: () async => tileOnClick(),
        ),
      ),
    );
  }
}