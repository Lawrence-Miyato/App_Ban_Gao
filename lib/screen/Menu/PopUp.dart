import 'package:app_ban_gao/screen/shopping/Cart.dart';
import 'package:app_ban_gao/screen/shopping/CartModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Popup extends StatefulWidget {
  final Map<String, dynamic> item;

  const Popup({super.key, required this.item});

  @override
  _PopupState createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  int _quantity = 1; // Khởi tạo số lượng mặc định là 1

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.item['name']),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(widget.item['image'], width: 100, height: 100),
          const SizedBox(height: 10),
          Text('Giá: ${widget.item['price']}'),

          // Thanh chọn số lượng
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (_quantity > 1) {
                      _quantity--;
                    }
                  });
                },
              ),
              Text('Số lượng: $_quantity',
                  style: const TextStyle(fontSize: 16)),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    _quantity++;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Thêm vào giỏ hàng'),
          onPressed: () {
            // Thêm sản phẩm vào giỏ hàng với số lượng đã chọn
            Provider.of<CartModel>(context, listen: false)
                .addItem(widget.item, _quantity);

            // Đóng pop-up
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Mua Ngay'),
          onPressed: () {
            // Thêm sản phẩm vào giỏ hàng với số lượng đã chọn
            Provider.of<CartModel>(context, listen: false)
                .addItem(widget.item, _quantity);

            // Chuyển hướng đến trang giỏ hàng
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const Cart()), // Chuyển hướng tới trang Cart
            );
          },
        )
      ],
    );
  }
}
