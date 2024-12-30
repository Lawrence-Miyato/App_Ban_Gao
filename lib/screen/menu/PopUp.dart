import 'package:flutter/material.dart';

class Popup extends StatefulWidget {
  final Map<String, dynamic> item;
  final Function(int) onAddToCart; // Callback để thêm vào giỏ hàng

  const Popup({super.key, required this.item, required this.onAddToCart});

  @override
  _PopupState createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  int quantity = 1; // Khởi tạo số lượng ban đầu

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.item['name']),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            widget.item['image'],
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Text('Giá: ${widget.item['price']}'),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Căn giữa các widget trong Row
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  if (quantity > 1) {
                    setState(() {
                      quantity--;
                    });
                  }
                },
              ),
              Text('$quantity'),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                },
              ),
            ],
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget.onAddToCart(
                quantity); // Gọi callback khi người dùng thêm sản phẩm vào giỏ hàng
            Navigator.pop(context);
          },
          child: const Text('Thêm vào giỏ'),
        ),
        TextButton(
          onPressed: () {
            // Thực hiện hành động mua ngay
            // Ví dụ: chuyển hướng đến trang thanh toán
            Navigator.pop(context); // Đóng popup
            // Thực hiện hành động mua ngay, ví dụ chuyển đến trang thanh toán
            // Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage()));
            // Hoặc có thể gọi một callback khác cho hành động này
          },
          child: const Text('Mua ngay'),
        ),
      ],
    );
  }
}
