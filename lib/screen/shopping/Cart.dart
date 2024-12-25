import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CartModel.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ Hàng'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // Xóa các sản phẩm đã chọn
              context.read<CartModel>().removeSelectedItems();
            },
          ),
        ],
      ),
      body: Consumer<CartModel>(
        builder: (context, cartModel, child) {
          if (cartModel.cartItems.isEmpty) {
            return const Center(
              child: Text('Giỏ hàng của bạn đang trống!'),
            );
          }

          return ListView.builder(
            itemCount: cartModel.cartItems.length,
            itemBuilder: (context, index) {
              final item = cartModel.cartItems[index];

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Thêm checkbox vào bên trái của sản phẩm
                      Checkbox(
                        value: cartModel.selectedItems[index],
                        onChanged: (bool? value) {
                          cartModel.toggleSelection(index);
                        },
                      ),
                      Image.network(
                        item['image'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  title: Text(
                    item['name'],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Giá: ${item['price']} x ${item['quantity']}',
                    style: const TextStyle(
                      color: Colors.green,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          cartModel.decreaseQuantity(index);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          cartModel.increaseQuantity(index);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
