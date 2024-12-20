import 'package:flutter/material.dart';

class Popup extends StatelessWidget {
  final Map<String, dynamic> item; // Nhận thông tin item từ bên ngoài

  const Popup({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // Nội dung widget mà Popup sẽ hiển thị
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Gọi hàm hiển thị pop-up
          showProductDialog(context);
        },
        child: const Text('Hiển thị thông tin sản phẩm'),
      ),
    );
  }

  // Hàm hiển thị pop-up
  void showProductDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(item['name']),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(item['image'], width: 100, height: 100),
              const SizedBox(height: 10),
              Text('Giá: ${item['price']}'),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Đóng'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Thêm vào giỏ hàng'),
              onPressed: () {
                // Hành động thêm vào giỏ hàng
                Navigator.of(context).pop();
                // Thêm chức năng xử lý khi thêm vào giỏ hàng tại đây
              },
            ),
          ],
        );
      },
    );
  }
}
