import 'package:flutter/material.dart';
import '../providers/cart.dart';
import '../screens/product_details.dart';
import '../providers/product.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    print('Here');
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetails.routeName, arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(

          backgroundColor: Colors.black54,
          // leading: Consumer<Product>(
          //   builder: (ctx, product1, child) =>
          //       IconButton(
          //         icon: Icon(
          //           product1.isFav ? Icons.favorite : Icons.favorite_border,
          //           color: Theme
          //               .of(context)
          //               .accentColor,
          //         ),
          //         onPressed: product1.toggleFavStatus,
          //       ),
          // ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          // trailing: IconButton(
          //   icon: Icon(
          //     Icons.shopping_cart,
          //     color: Theme
          //         .of(context)
          //         .accentColor,
          //   ),
          //   onPressed: () {
          //     cart.additem(product.id, product.title, product.price);
          //   },
          // ),
        ),
      ),
    );
  }
}
