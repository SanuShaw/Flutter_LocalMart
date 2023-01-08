import 'package:flutter/material.dart';
import '../screens/order_screen.dart';
import '../screens/product_overview_screen.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            AppBar(
              title: Text('Hello Friends'),
              automaticallyImplyLeading: false,
            ),
            Divider(),
            ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(ProductOverviewScreen.routeName);
                }),
            ListTile(
                title: Text('Orders'),
                leading: Icon(Icons.shopping_bag),
                onTap: () {
                  Navigator.of(context).pushNamed(OrderScreen.routeName);
                })
          ],
        ),
      ),
    );
  }
}
