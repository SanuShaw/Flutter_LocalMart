import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import './product_item.dart';

class ProductsGridView extends StatelessWidget {
  final bool _showFavOrNot;
  ProductsGridView(this._showFavOrNot);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final _items = !_showFavOrNot? productsData.items:productsData.favItems;
    return GridView.builder(
      padding: EdgeInsets.all(5.0),
      itemCount: _items.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        //create: (c) => _items[i],
        value: _items[i],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 7 / 6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
