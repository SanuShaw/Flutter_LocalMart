import 'package:flutter/material.dart';
import './product.dart';

enum Category{
  small,
  medium,
  large,
  number,
}
class Products with ChangeNotifier{               //Mixins
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Potato',
      //description: 'A red shirt - it is pretty red!',
      price: 39.99,
      imageUrl:
      'https://images.unsplash.com/photo-1590165482129-1b8b27698780?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=282&q=80',
      category: 'large',
    ),
    Product(
      id: 'p2',
      title: 'Onion',
      //description: 'A red shirt - it is pretty red!',
      price: 49.99,
      imageUrl:
      'https://images.unsplash.com/photo-1508747703725-719777637510?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8b25pb258ZW58MHx8MHw%3D&auto=format&fit=crop&w=500&q=60',
      category: 'large',
    ),
    Product(
      id: 'p3',
      title: 'Tomato',
      //description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
      'https://images.unsplash.com/photo-1444731961956-751ed90465a5?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTJ8fHZlZ2V0YWJsZXxlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=500&q=60',
      category: 'medium',
    ),
    Product(
      id: 'p4',
      title: 'Chilli',
      //description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
      'https://images.unsplash.com/photo-1524593410820-38510f580a77?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=750&q=80',
      category: 'small',
    ),
    Product(
      id: 'p5',
      title: 'Garlic',
      //description: 'A red shirt - it is pretty red!',
      price: 79.99,
      imageUrl:
      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/garlic-braid-1532701804.jpg?crop=1.00xw:0.753xh;0,0.120xh&resize=480:*',
      category: 'small',
    ),
    Product(
      id: 'p6',
      title: 'Ginger',
      //description: 'A red shirt - it is pretty red!',
      price: 109.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyqmw2VfYl7nX-p87z_ZNqPUPx-5B5F3lJ1Q&usqp=CAU',
       category: 'small',
    ),
    Product(
      id: 'p7',
      title: 'Cauliflower',
      //description: 'A red shirt - it is pretty red!',
      price: 39.99,
      imageUrl:
      'https://images.unsplash.com/photo-1566842600175-97dca489844f?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1400&q=80',
      category: 'number',
    ),
    Product(
      id: 'p8',
      title: 'Carrot',
      //description: 'A red shirt - it is pretty red!',
      price: 99.99,
      imageUrl:
          'https://images.unsplash.com/photo-1590868309235-ea34bed7bd7f?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fHZlZ2V0YWJsZXxlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=500&q=60',
      category: 'medium',
    ),
    Product(
      id: 'p9',
      title: 'Eggplant',
      //description: 'A red shirt - it is pretty red!',
      price: 109.99,
      imageUrl:
          'https://images.unsplash.com/photo-1605197378540-10ebaf6999e5?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=334&q=80',
      category: 'medium',
    ),
    Product(
      id: 'p10',
      title: 'Pumpkin',
      //description: 'A red shirt - it is pretty red!',
      price: 79.99,
      imageUrl:
          'https://assetscdn1.paytm.com/images/catalog/product/H/HO/HOMPUMPKIN-SMALRDRO688555BCECC46F/1563034545698_0..jpg',
      category: 'medium',
    ),
    Product(
      id: 'p11',
      title: 'Cucumber',
      //description: 'A red shirt - it is pretty red!',
      price: 99.99,
      imageUrl:
          'https://www.1mg.com/hi/patanjali/wp-content/uploads/2019/01/Kheera.jpg',
      category: 'medium',
    ),
    Product(
      id: 'p12',
      title: 'Cabbage',
      //description: 'A red shirt - it is pretty red!',
      price: 49.99,
      imageUrl:
      'https://cdn.vox-cdn.com/thumbor/PoeSF-cNO28OTtNerC1cG-W6g6c=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/19754644/AdobeStock_173509538.jpeg',
      category: 'number',
    ),


  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favItems{
    return _items.where((product) => product.isFav).toList();
  }

 void addProduct(){
    //_items.add(value);
    notifyListeners();
 }

 Product findById(String id){
    return _items.firstWhere((element) => element.id==id);
 }

}