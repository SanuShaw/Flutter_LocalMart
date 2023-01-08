import 'package:flutter/material.dart';
import '../widgets/badge.dart';
//import '../providers/product.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../providers/cart.dart';
import 'cart_screen.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = '/product-details';

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var loadedProduct;
  var dropdownValue = '';
  final _scaffoldKey = GlobalKey<ScaffoldState>(); // new line
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments;
    final cart = Provider.of<Cart>(context, listen: false);
    loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    final deviceSize = MediaQuery.of(context).size;
    final listVal = dropDownValues();
    dropdownValue = dropdownValue.isEmpty ? listVal.first : dropdownValue;
    bool favIconValue = loadedProduct.isFav;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(loadedProduct.title),
        actions: [
          //For Cart icon
          Consumer<Cart>(
            builder: (_, cart, childLable) => Badge(
              child: childLable,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                //color: Colors.white70,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    loadedProduct.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 240, 10, 0),
                  alignment: Alignment.topRight,
                  child: //Consumer<Product>(
                      // builder: (ctx, product1, _) =>
                      IconButton(
                    icon: Icon(
                      favIconValue ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                      size: 50.0,
                    ),
                    onPressed: () {
                      loadedProduct.toggleFavStatus();
                      setState(() {
                        favIconValue = !favIconValue;
                      });
                    },
                    tooltip: !favIconValue ?'Mark as Favourite':'Remove from Favourite',
                  ),
                ),
                //),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Price : ',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  '${loadedProduct.price}',
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  ' rs / KG ',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 10),
            //   width: double.infinity,
            //   child: Text(
            //     //loadedProduct.description,
            //     'Description shows here',
            //     textAlign: TextAlign.center,
            //     softWrap: true,
            //   ),
            // )
            Text(
              'Select Quantity : ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 20,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: listVal.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: FloatingActionButton.extended(
          onPressed: () {
            _scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text('Added..!!'),
                duration: Duration(seconds: 1),
              ),
            );
            cart.additem(
                loadedProduct.id, loadedProduct.title, (loadedProduct.price*cart.getValueFromQuantity(dropdownValue)).roundToDouble(),dropdownValue);
          },
          label: Text('ADD to Bag'),
          icon: Icon(Icons.shopping_bag),
          backgroundColor: Theme.of(context).accentColor,
        ),
      ),
    );
  }

  dropDownValues() {
    if (loadedProduct.category == 'small')
      return ['100gm', '200gm', '250gm', '500gm', '1kg'];
    else if (loadedProduct.category == 'medium')
      return ['200gm', '250gm', '500gm', '1kg', '2kg'];
    else if (loadedProduct.category == 'large')
      return ['500gm', '1kg', '2kg', '3kg', '4kg', '5kg'];
    else if (loadedProduct.category == 'number') return ['1pc', '2pc', '3pc'];
  }
}
