import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/send_mail.dart';
import '../providers/orders.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  double delivery_charge;
  final _scaffoldKey = GlobalKey<ScaffoldState>(); // new line

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    cart.totalAmount < 99 ? delivery_charge = 10.0 : delivery_charge = 0;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '${cart.totalAmount + delivery_charge} rs',
                      //.toStringAsFixed(2)
                      style: TextStyle(
                        color: Theme.of(context).primaryTextTheme.title.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  OutlineButton(
                    child: Text('ORDER NOW'),
                    onPressed: cart.totalAmount==0?null:(){
                      Provider.of<Orders>(context, listen: false).addOrder(
                        cart.items.values.toList(),
                        cart.totalAmount + delivery_charge,
                      );

                      // Timer(Duration(seconds: 3), () {
                      //   // 5s over, navigate to a new page
                      SendMail()
                          .sendMail(cart.items.values.toList(),
                              cart.totalAmount + delivery_charge)
                          .then(
                            //print(Provider.of<Orders>(context, listen: false).orders.first.products.length),
                            print('Mail Send'),
                          );
                      //});
                      cart.clear();
                      _scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.deepOrange[400],
                          content: Container(
                            height: 20.0,
                            alignment: Alignment.center,
                            child: Text(
                                'Order Successfully Placed..Thank you 😀 ',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),),
                          ),
                          duration: Duration(seconds: 3),
                        ),
                      );
                    },
                    textColor: Theme.of(context).primaryColor,
                    shape: StadiumBorder(),
                  )
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Delivery Charge : $delivery_charge rs',
                style: TextStyle(
                  backgroundColor: Colors.grey[200],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItem(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
              ),
            ),
          )
        ],
      ),
    );
  }
}
