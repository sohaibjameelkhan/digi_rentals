import 'package:digi_rentals/Models/cart_model.dart';

import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> _list = [];

  void saveCartData(CartModel cartModel) {
    _list.add(cartModel);
    notifyListeners();
  }

  List<CartModel> get getCartList => _list;

  void emptyMyLocalCart() {
    _list.clear();
    notifyListeners();
  }
}
