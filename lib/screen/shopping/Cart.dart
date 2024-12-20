import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // Danh sách sản phẩm trong giỏ hàng
  List<Map<String, dynamic>> cartItems = [];

  // Hàm thêm sản phẩm vào giỏ hàng
  void addItem(String name, double price) {
    setState(() {
      cartItems.add({'name': name, 'price': price, 'quantity': 1});
    });
  }

  // Hàm tăng số lượng sản phẩm
  void increaseQuantity(int index) {
    setState(() {
      cartItems[index]['quantity']++;
    });
  }

  // Hàm giảm số lượng sản phẩm
  void decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity']--;
      } else {
        cartItems.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ Hàng'),
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'Giỏ hàng của bạn đang trống!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(item['name']),
                    subtitle:
                        Text('Giá: ${item['price']} x ${item['quantity']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => decreaseQuantity(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => increaseQuantity(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Thêm sản phẩm ví dụ vào giỏ hàng
          addItem('Sản phẩm mới', 100.0);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
