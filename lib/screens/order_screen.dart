import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart' show Orders;
import '../screens/product_overview_screen.dart';
import '../widgets/my_drawer.dart';
import '../widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static final routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context).orders;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(ProductOverviewScreen.routeName);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => OrderItem(orderData[index]),
        itemCount: orderData.length,
      ),
      //drawer: MyDrawer(),
    );
  }
}
