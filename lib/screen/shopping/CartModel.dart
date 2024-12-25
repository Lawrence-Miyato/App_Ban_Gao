import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];
  List<bool> selectedItems = []; // Danh sách trạng thái checkbox

  List<Map<String, dynamic>> get cartItems => _cartItems;

  int get itemCount =>
      _cartItems.fold<int>(0, (sum, item) => sum + (item['quantity'] as int));

  // Thêm sản phẩm vào giỏ hàng với số lượng
  void addItem(Map<String, dynamic> item, int quantity) {
    bool itemExists = false;
    for (var cartItem in _cartItems) {
      if (cartItem['name'] == item['name']) {
        cartItem['quantity'] += quantity;
        itemExists = true;
        break;
      }
    }

    if (!itemExists) {
      _cartItems.add({
        'image': item['image'],
        'name': item['name'],
        'price': item['price'],
        'quantity': quantity,
      });
      selectedItems.add(false); // Thêm trạng thái checkbox cho sản phẩm mới
    }
    notifyListeners();
  }

  void increaseQuantity(int index) {
    _cartItems[index]['quantity']++;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (_cartItems[index]['quantity'] > 1) {
      _cartItems[index]['quantity']--;
    } else {
      _cartItems.removeAt(index);
      selectedItems
          .removeAt(index); // Xóa trạng thái checkbox khi sản phẩm bị xóa
    }
    notifyListeners();
  }

  void toggleSelection(int index) {
    selectedItems[index] = !selectedItems[index]; // Đảo trạng thái checkbox
    notifyListeners();
  }

  // Xóa các sản phẩm đã chọn
  void removeSelectedItems() {
    for (int i = _cartItems.length - 1; i >= 0; i--) {
      if (selectedItems[i]) {
        _cartItems.removeAt(i);
        selectedItems.removeAt(i); // Xóa sản phẩm và trạng thái checkbox
      }
    }
    notifyListeners();
  }
}
