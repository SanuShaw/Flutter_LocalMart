import 'dart:math';

import 'package:flutter/material.dart';
import '../providers/orders.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final ord.OrderItem data;

  OrderItem(this.data);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Order Amount : ${widget.data.amount} rs'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.data.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.data.products.length * 20.0 + 10, 100),
              child: ListView(
                children: widget.data.products
                    .map(
                      (prod) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        prod.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Quantity : ${prod.quantity} , Price : ${prod.price} rs',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
