import 'package:flutter/material.dart';

// Lớp quản lý giỏ hàng
class CartModel extends ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  // Thêm sản phẩm vào giỏ hàng với số lượng
  void addItem(Map<String, dynamic> item, int quantity) {
    // Kiểm tra nếu sản phẩm đã có trong giỏ hàng
    bool itemExists = false;
    for (var cartItem in _cartItems) {
      if (cartItem['name'] == item['name']) {
        cartItem['quantity'] += quantity; // Cập nhật số lượng
        itemExists = true;
        break;
      }
    }

    // Nếu sản phẩm chưa có trong giỏ hàng, thêm mới và đặt số lượng theo quantity
    if (!itemExists) {
      _cartItems.add({
        'image': item['image'],
        'name': item['name'],
        'price': item['price'],
        'quantity': quantity,
      });
    }

    notifyListeners(); // Thông báo rằng giỏ hàng đã thay đổi
  }

  // Tăng số lượng sản phẩm
  void increaseQuantity(int index) {
    _cartItems[index]['quantity']++;
    notifyListeners();
  }

  // Giảm số lượng sản phẩm
  void decreaseQuantity(int index) {
    if (_cartItems[index]['quantity'] > 1) {
      _cartItems[index]['quantity']--;
    } else {
      _cartItems.removeAt(index);
    }
    notifyListeners();
  }
}
