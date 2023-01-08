import 'package:flutter/material.dart';

class Product with ChangeNotifier{    //Minins
  final String id;
  final String title;
  //final String description;
  final String imageUrl;
  final double price;
  final String category;
  bool isFav;

  Product({
    @required this.id,
    @required this.title,
    //@required this.description,
    @required this.category,
    @required this.imageUrl,
    @required this.price,
    this.isFav = false,
  });

  void toggleFavStatus(){
    isFav= !isFav;
    notifyListeners();
  }
}
