import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';

import '../providers/cart.dart';

//Its the sub-elements of the Cart screens
class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final String quantity;
  final String title;

  CartItem(
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(2),
                child: FittedBox(
                  child: Text(
                      '${(Provider.of<Products>(context, listen: false).findById(productId).price).toInt()}rs/kg'),
                ),
              ),
              backgroundColor: Colors.purple[200],
            ),
            title: Text(title),
            //subtitle: Text('Price: \$${(price * getValueFromQuantity(quantity)).roundToDouble()}'),
            subtitle: Text('Price: $price rs'),
            trailing: Text('$quantity'),
          ),
        ),
      ),
    );
  }

}
