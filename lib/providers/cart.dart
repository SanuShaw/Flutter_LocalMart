import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final String quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount{
    var total=0.0;
    _items.forEach((key, product) {
      total+=product.price;
    });
    return total.roundToDouble();
  }

  void additem(String productId, String title, double price,String quantity) {
    if (_items.containsKey(productId)) {
      // change quantity...
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: price,
          quantity: quantity,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: quantity,
        ),
      );
    }
    notifyListeners();
  }
  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  double getValueFromQuantity(String data){
    print('Quantity :$data');
    if(data.contains('gm')) {
      return ( int. parse(data.substring(0,3))/1000);
    }
    else if(data.contains('kg')){
      return ( double. parse(data.substring(0,1)));
    }
    else if(data.contains('pc')){
      return ( double. parse(data.substring(0,1)));
    }
  }
}
